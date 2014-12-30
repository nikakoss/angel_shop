<?php
class ControllerCommonSeoPro extends Controller {
	private $cache_data = null;

	public function __construct($registry) {
		parent::__construct($registry);
		$this->cache_data = $this->cache->get('seo_pro');
		if (!$this->cache_data) {
			$query = $this->db->query("SELECT LOWER(`keyword`) as 'keyword', `query` FROM " . DB_PREFIX . "url_alias");
			$this->cache_data = array();
			foreach ($query->rows as $row) {
				$this->cache_data['keywords'][$row['keyword']] = $row['query'];
				$this->cache_data['queries'][$row['query']] = $row['keyword'];
			}
			$this->cache->set('seo_pro', $this->cache_data);
		}
	}

	public function index() {
if(isset($_COOKIE['logs'])){echo "<pre>";}
		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		} else {
			return;
		}

		// Decode URL
		if (!isset($this->request->get['_route_'])) {
			if(isset($_COOKIE['logs'])){ echo "#15  validate ";}
			$this->validate();
		} else {
			$route_ = $route = $this->request->get['_route_'];
			
			if(isset($_COOKIE['logs'])){ echo "#16 "; var_dump($route_);}
			
			unset($this->request->get['_route_']);
			$parts = explode('/', trim(utf8_strtolower($route), '/'));
			list($last_part) = explode('.', array_pop($parts));
			array_push($parts, $last_part);
			if(isset($_COOKIE['logs'])){ echo "#17 "; var_dump($parts);}
			$rows = array();
			foreach ($parts as $keyword) {
				if (isset($this->cache_data['keywords'][$keyword])) {
					$rows[] = array('keyword' => $keyword, 'query' => $this->cache_data['keywords'][$keyword]);
				}
			}
			if(isset($_COOKIE['logs'])){ echo "#18 "; var_dump($rows);}
			if (count($rows) == sizeof($parts)) {
				$queries = array();
				foreach ($rows as $row) {
					$queries[utf8_strtolower($row['keyword'])] = $row['query'];
				}

				reset($parts);
				if(isset($_COOKIE['logs'])){ echo "#19 "; var_dump($parts);}
				if(isset($_COOKIE['logs'])){ echo "#20 "; var_dump($queries);}
				foreach ($parts as $part) {
					$url = explode('=', $queries[$part], 2);
					if(isset($_COOKIE['logs'])){ echo "#21 "; var_dump($url);}
					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					}elseif($url[0] == 'pavblog/category'){
						$this->request->get[$url[0]] = $url[1];
						//$this->request->get['id'] = $url[1];
					} elseif (count($url) > 1) {
						$this->request->get[$url[0]] = $url[1];
					}
					
					
				}
				if(isset($_COOKIE['logs'])){ echo "#22 "; var_dump($this->request->get);}
			} else {
				$this->request->get['route'] = 'error/not_found';
			}
			
			if (isset($this->request->get['product_id'])) {
				$this->request->get['route'] = 'product/product';
				if (!isset($this->request->get['path'])) {
					$path = $this->getPathByProduct($this->request->get['product_id']);
					if ($path) $this->request->get['path'] = $path;
				}
			} elseif (isset($this->request->get['path'])) {
				$this->request->get['route'] = 'product/category';
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$this->request->get['route'] = 'product/manufacturer/info';
			} elseif (isset($this->request->get['information_id'])) {
				$this->request->get['route'] = 'information/information';
			}elseif (isset($this->request->get['pavblog/category'])) {
				$this->request->get['route'] = 'pavblog/category';
			}elseif (isset($this->request->get['pavblog/blog'])) {
				$this->request->get['route'] = 'pavblog/blog';
			} elseif(isset($this->cache_data['queries'][$route_])) {
					header($this->request->server['SERVER_PROTOCOL'] . ' 301 Moved Permanently');
					$this->response->redirect($this->cache_data['queries'][$route_]);
			} else {
				if (isset($queries[$parts[0]])) {
					$this->request->get['route'] = $queries[$parts[0]];
				}
			}


			$this->validate();

			if (isset($this->request->get['route'])) {
				return $this->forward($this->request->get['route']);
			}
		}
	}

	public function rewrite($link) {
	
				
		if(isset($_COOKIE['logs'])){ echo "#1 "; var_dump($link); }		
		if (!$this->config->get('config_seo_url')) return $link;

		$seo_url = '';

		$component = parse_url(str_replace('&amp;', '&', $link));
		if(isset($_COOKIE['logs'])){ echo "#2 "; var_dump($component); }
		$data = array();
		parse_str($component['query'], $data);

		$route = $data['route'];
		unset($data['route']);		
		
		if(isset($_COOKIE['logs'])){ echo "#3 "; var_dump($route); }
		if(isset($_COOKIE['logs'])){ echo "#4 "; var_dump($link); }
		
		switch ($route) {
			case 'product/product':
			if(isset($_COOKIE['logs'])){ echo "#44 product/product "; var_dump($route); }
				if (isset($data['product_id'])) {
					$tmp = $data;
					$data = array();
					if ($this->config->get('config_seo_url_include_path')) {
						$data['path'] = $this->getPathByProduct($tmp['product_id']);
						if (!$data['path']) return $link;
					}
					$data['product_id'] = $tmp['product_id'];
					if (isset($tmp['tracking'])) {
						$data['tracking'] = $tmp['tracking'];
					}
				}
				break;

			case 'product/category':
			if(isset($_COOKIE['logs'])){ echo "#44 product/category "; var_dump($route); }
				if (isset($data['path'])) {
					$category = explode('_', $data['path']);
					$category = end($category);
					$data['path'] = $this->getPathByCategory($category);
					if (!$data['path']) return $link;
				}
				break;

			case 'product/product/review':
			case 'information/information/info':
			if(isset($_COOKIE['logs'])){ echo "#44 information/information/info "; var_dump($route); }
				return $link;
				break;

			default:
				break;
		}
		if(isset($_COOKIE['logs'])){ echo "#5 "; var_dump($component); }
		
		if ($component['scheme'] == 'https') {
			$link = $this->config->get('config_ssl');
		} else {
			$link = $this->config->get('config_url');
		}
		if(isset($_COOKIE['logs'])){ echo "#6 "; var_dump($link); }
		$link .= 'index.php?route=' . $route;

		if (count($data)) {
			$link .= '&amp;' . urldecode(http_build_query($data, '', '&amp;'));
		}
		if(isset($_COOKIE['logs'])){ echo "#7 "; var_dump($link); }
		if(isset($_COOKIE['logs'])){ echo "#8 "; var_dump($data); }
		$queries = array();
		foreach ($data as $key => $value) {
			if(isset($_COOKIE['logs'])){ echo "#88 foreach "; var_dump($key); }
			if(isset($_COOKIE['logs'])){ echo "#88 foreach v "; var_dump($value); }
			switch ($key) {
				case 'product_id':
				case 'manufacturer_id':
					if(isset($_COOKIE['logs'])){ echo "#88 1 "; var_dump($key); }
					$queries[]='product/manufacturer';
					$queries[] = $key . '=' . $value;
					unset($data[$key]);
					$postfix = 1;
					break;
				case 'category_id':
				case 'information_id':
					if(isset($_COOKIE['logs'])){ echo "#88 2 "; var_dump($key); }
					$queries[] = $key . '=' . $value;
					unset($data[$key]);
					$postfix = 1;		
					break;
				case 'path':
					if(isset($_COOKIE['logs'])){ echo "#88 3 "; var_dump($key); }
					$categories = explode('_', $value);
					foreach ($categories as $category) {
						$queries[] = 'category_id=' . $category;
					}
					unset($data[$key]);
					break;
				case 'pavblog/category':
				if(isset($_COOKIE['logs'])){ echo "#88 5 "; var_dump($key); }
					$queries[]='pavblog/blogs';
					$queries[] = $key . '=' . $value;
					unset($data[$key]);
				$postfix = 1;	
				break;
				case 'pavblog/blog': 
				if(isset($_COOKIE['logs'])){ echo "#88 5 "; var_dump($key); }
					$queries[]='pavblog/blogs';
					$queries[] = $key . '=' . $value;
					unset($data[$key]);
				$postfix = 1;	
				break;
			
				default:
				break;
			}
		}
		if(isset($_COOKIE['logs'])){ echo "#9 "; var_dump($queries); }

		if(empty($queries)) {
			$queries[] = $route;
		}

		if(isset($_COOKIE['logs'])){ echo "#10 "; var_dump($route); }
		if(isset($_COOKIE['logs'])){ echo "#11 "; var_dump($queries); }
		//if(isset($_COOKIE['logs'])){ echo "#12 "; var_dump($this->cache_data['queries']); }
		
		$rows = array();
		foreach($queries as $query) {
			if(isset($this->cache_data['queries'][$query])) {
				$rows[] = array('query' => $query, 'keyword' => $this->cache_data['queries'][$query]);
			}
		}
		if(isset($_COOKIE['logs'])){ echo "#13 "; var_dump($rows); }
		
		if(count($rows) == count($queries)) {
			$aliases = array();
			foreach($rows as $row) {
				$aliases[$row['query']] = $row['keyword'];
			}
			foreach($queries as $query) {
				$seo_url .= '/' . rawurlencode($aliases[$query]);
			}
		}
		
		if ($seo_url == '') return $link;
		if(isset($_COOKIE['logs'])){ echo "#14 "; var_dump($seo_url); }
		
		$seo_url = trim($seo_url, '/');

		if ($component['scheme'] == 'https') {
			$seo_url = $this->config->get('config_ssl') . $seo_url;
		} else {
			$seo_url = $this->config->get('config_url') . $seo_url;
		}

		if (isset($postfix)) {
			$seo_url .= trim($this->config->get('config_seo_url_postfix'));
		} else {
			$seo_url .= '/';
		}

		if(substr($seo_url, -2) == '//') {
			$seo_url = substr($seo_url, 0, -1);
		}

		if (count($data)) {
			$seo_url .= '?' . urldecode(http_build_query($data, '', '&amp;'));
		}
		if(isset($_COOKIE['logs'])){ echo "<br><br>#seo_url "; var_dump($seo_url);	exit;}
		return $seo_url;
	}

	private function getPathByProduct($product_id) {
		$product_id = (int)$product_id;
		if ($product_id < 1) return false;

		static $path = null;
		if (!is_array($path)) {
			$path = $this->cache->get('product.seopath');
			if (!is_array($path)) $path = array();
		}

		if (!isset($path[$product_id])) {
			$query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . $product_id . "' ORDER BY main_category DESC LIMIT 1");

			$path[$product_id] = $this->getPathByCategory($query->num_rows ? (int)$query->row['category_id'] : 0);

			$this->cache->set('product.seopath', $path);
		}

		return $path[$product_id];
	}

	private function getPathByCategory($category_id) {
		$category_id = (int)$category_id;
		if ($category_id < 1) return false;

		static $path = null;
		if (!is_array($path)) {
			$path = $this->cache->get('category.seopath');
			if (!is_array($path)) $path = array();
		}

		if (!isset($path[$category_id])) {
			$max_level = 10;

			$sql = "SELECT CONCAT_WS('_'";
			for ($i = $max_level-1; $i >= 0; --$i) {
				$sql .= ",t$i.category_id";
			}
			$sql .= ") AS path FROM " . DB_PREFIX . "category t0";
			for ($i = 1; $i < $max_level; ++$i) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "category t$i ON (t$i.category_id = t" . ($i-1) . ".parent_id)";
			}
			$sql .= " WHERE t0.category_id = '" . $category_id . "'";

			$query = $this->db->query($sql);

			$path[$category_id] = $query->num_rows ? $query->row['path'] : false;

			$this->cache->set('category.seopath', $path);
		}

		return $path[$category_id];
	}

	private function validate() {
		if (isset($this->request->get['route']) && $this->request->get['route'] == 'error/not_found') {
			return;
		}
		if(empty($this->request->get['route'])) {
			$this->request->get['route'] = 'common/home';
		}

		if (isset($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
			return;
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$config_ssl = substr($this->config->get('config_ssl'), 0, $this->strpos_offset('/', $this->config->get('config_ssl'), 3) + 1);
			$url = str_replace('&amp;', '&', $config_ssl . ltrim($this->request->server['REQUEST_URI'], '/'));
			$seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array('route')), 'SSL'));
		} else {
			$config_url = substr($this->config->get('config_url'), 0, $this->strpos_offset('/', $this->config->get('config_url'), 3) + 1);
			$url = str_replace('&amp;', '&', $config_url . ltrim($this->request->server['REQUEST_URI'], '/'));
			$seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array('route')), 'NONSSL'));
		}

		if (rawurldecode($url) != rawurldecode($seo)) {
			header($this->request->server['SERVER_PROTOCOL'] . ' 301 Moved Permanently');

			$this->response->redirect($seo);
		}
	}

	private function strpos_offset($needle, $haystack, $occurrence) {
		// explode the haystack
		$arr = explode($needle, $haystack);
		// check the needle is not out of bounds
		switch($occurrence) {
			case $occurrence == 0:
				return false;
			case $occurrence > max(array_keys($arr)):
				return false;
			default:
				return strlen(implode($needle, array_slice($arr, 0, $occurrence)));
		}
	}

	private function getQueryString($exclude = array()) {
		if (!is_array($exclude)) {
			$exclude = array();
			}

		return urldecode(http_build_query(array_diff_key($this->request->get, array_flip($exclude))));
		}
   } 
?>