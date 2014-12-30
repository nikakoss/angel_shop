<?php echo $header; ?>
<style type="text/css">
	.seogen-list {
		border-collapse: collapse;
	}

	.seogen-list tbody td {
		padding: 5px;
		vertical-align: top;
	}
	.seogen-list input[type="text"] {
		width: 430px;
	}
	.seogen-list a.button {
		float: right;
		margin-top: 5px;
		margin-right: 10px
	}
	.seogen-list td {
		border-bottom: inherit;
		border-right: inherit;
	}
	.seogen-list span.bold {
		font-weight: bold;
	}
</style>

<div id="content">
	<div class="breadcrumb">
		<?php foreach($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	<?php if($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/module.png" alt=""/> <?php echo $heading_title; ?></h1>

			<div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';"
																													class="button"><?php echo $button_cancel; ?></a></div>
		</div>
		<div class="content">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<input type="hidden" name="seogen[main_category_exists]" value="<?php echo (isset($seogen['main_category_exists']) && $seogen['main_category_exists']) ? 1 : 0?>">
				<table class="seogen-list" style="width: 590px;">
					<tbody style="border: 1px solid #003A88;">
					<tr>
						<td colspan="2"><label for="seogen_status"><?php echo $entry_status; ?></label></td>
						<td><input id="seogen_status" type="checkbox" name="seogen_status" <?php if($seogen_status){echo 'checked="checked"';}?>></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td style="text-align: right;"><label for="seogen_overwrite"><?php echo $entry_overwrite; ?></label></td>
						<td><input id="seogen_overwrite" type="checkbox"></td>
					</tr>
					</tbody>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tbody id="categories" style="border: 1px solid #003A88;">
					<tr>
						<td style="width: 120px;"><?php echo $text_categories; ?></td>
						<td>
							<input type="text" name="seogen[categories_template]" value="<?php echo $seogen['categories_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_categories_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[categories_overwrite]" <?php if (isset($seogen['categories_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
					<?php if(isset($seogen['categories_h1_template'])) { ?>
					<tr>
						<td style="width: 120px;"><?php echo $text_categories_h1; ?></td>
						<td>
							<input type="text" name="seogen[categories_h1_template]"
																	  value="<?php echo $seogen['categories_h1_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_categories_h1_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[categories_h1_overwrite]" <?php if (isset($seogen['categories_h1_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['categories_title_template'])) { ?>
					<tr>
						<td style="width: 120px;"><?php echo $text_categories_title; ?></td>
						<td>
							<input type="text" name="seogen[categories_title_template]"
																	  value="<?php echo $seogen['categories_title_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_categories_title_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[categories_title_overwrite]" <?php if (isset($seogen['categories_title_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['categories_meta_keyword_template'])) { ?>
					<tr>
						<td style="width: 120px;"><?php echo $text_categories_meta_keyword; ?></td>
						<td>
							<input type="text" name="seogen[categories_meta_keyword_template]"
																	  value="<?php echo $seogen['categories_meta_keyword_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_categories_meta_keyword_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[categories_meta_keyword_overwrite]" <?php if (isset($seogen['categories_meta_keyword_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['categories_meta_description_template'])) { ?>
					<tr>
						<td style="width: 120px;"><?php echo $text_categories_meta_description; ?></td>
						<td>
							<input type="text" name="seogen[categories_meta_description_template]"
																	  value="<?php echo $seogen['categories_meta_description_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_categories_meta_description_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[categories_meta_description_overwrite]" <?php if (isset($seogen['categories_meta_description_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<tr>
						<td colspan="3"><a onclick="generate('categories');" class="button"><?php echo $text_generate; ?></a></td>
					</tr>
					</tbody>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tbody id="products" style="border: 1px solid #003A88;">
					<tr>
						<td><?php echo $text_products ?></td>
						<td>
							<input type="text" name="seogen[products_template]" value="<?php echo $seogen['products_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_products_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[products_overwrite]" <?php if (isset($seogen['products_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
					<?php if(isset($seogen['products_h1_template'])) { ?>

					<tr>
						<td><?php echo $text_products_h1 ?></td>
						<td>
							<input type="text" name="seogen[products_h1_template]" value="<?php echo $seogen['products_h1_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_products_h1_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[products_h1_overwrite]" <?php if (isset($seogen['products_h1_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['products_title_template'])) { ?>
					<tr>
						<td><?php echo $text_products_title ?></td>
						<td>
							<input type="text" name="seogen[products_title_template]"
																	  value="<?php echo $seogen['products_title_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_products_title_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[products_title_overwrite]" <?php if (isset($seogen['products_title_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['products_meta_keyword_template'])) { ?>
					<tr>
						<td><?php echo $text_products_meta_keyword ?></td>
						<td>
							<input type="text" name="seogen[products_meta_keyword_template]"
																	  value="<?php echo $seogen['products_meta_keyword_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_products_meta_keyword_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[products_meta_keyword_overwrite]" <?php if (isset($seogen['products_meta_keyword_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['products_meta_description_template'])) { ?>
					<tr>
						<td><?php echo $text_products_meta_description ?></td>
						<td>
							<input type="text" name="seogen[products_meta_description_template]"
																	  value="<?php echo $seogen['products_meta_description_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_products_meta_description_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[products_meta_description_overwrite]" <?php if (isset($seogen['products_meta_description_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<tr>
						<td colspan="3"><a onclick="generate('products');" class="button"><?php echo $text_generate; ?></a></td>
					</tr>
					</tbody>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tbody id="manufacturers" style="border: 1px solid #003A88;">
					<tr>
						<td><?php echo $text_manufacturers ?></td>
						<td>
							<input type="text" name="seogen[manufacturers_template]"
																	  value="<?php echo $seogen['manufacturers_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_manufacturers_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[manufacturers_overwrite]" <?php if (isset($seogen['manufacturers_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
					<?php if(isset($seogen['manufacturers_h1_template'])) { ?>
					<tr>
						<td><?php echo $text_manufacturers_h1 ?></td>
						<td>
							<input type="text" name="seogen[manufacturers_h1_template]"
																	  value="<?php echo $seogen['manufacturers_h1_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_manufacturers_h1_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[manufacturers_h1_overwrite]" <?php if (isset($seogen['manufacturers_h1_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['manufacturers_title_template'])) { ?>
					<tr>
						<td><?php echo $text_manufacturers_title ?></td>
						<td>
							<input type="text" name="seogen[manufacturers_title_template]"
																	  value="<?php echo $seogen['manufacturers_title_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_manufacturers_title_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[manufacturers_title_overwrite]" <?php if (isset($seogen['manufacturers_title_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['manufacturers_meta_keyword_template'])) { ?>
					<tr>
						<td><?php echo $text_manufacturers_meta_keyword ?></td>
						<td>
							<input type="text" name="seogen[manufacturers_meta_keyword_template]"
																	  value="<?php echo $seogen['manufacturers_meta_keyword_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_manufacturers_meta_keyword_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[manufacturers_meta_keyword_overwrite]" <?php if (isset($seogen['manufacturers_meta_keyword_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['manufacturers_meta_description_template'])) { ?>
					<tr>
						<td><?php echo $text_manufacturers_meta_description ?></td>
						<td>
							<input type="text" name="seogen[manufacturers_meta_description_template]"
																	  value="<?php echo $seogen['manufacturers_meta_description_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_manufacturers_meta_description_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[manufacturers_meta_description_overwrite]" <?php if (isset($seogen['manufacturers_meta_description_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<tr>
						<td colspan="3"><a onclick="generate('manufacturers');" class="button"><?php echo $text_generate; ?></a></td>
					</tr>
					<tbody>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
					<tbody id="informations" style="border: 1px solid #003A88;">
					<tr>
						<td><?php echo $text_informations ?></td>
						<td>
							<input type="text" name="seogen[informations_template]" value="<?php echo $seogen['informations_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_informations_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[informations_overwrite]" <?php if (isset($seogen['informations_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
					<?php if(isset($seogen['informations_h1_template'])) { ?>

					<tr>
						<td><?php echo $text_informations_h1 ?></td>
						<td>
							<input type="text" name="seogen[informations_h1_template]" value="<?php echo $seogen['informations_h1_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_informations_h1_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[informations_h1_overwrite]" <?php if (isset($seogen['informations_h1_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['informations_title_template'])) { ?>
					<tr>
						<td><?php echo $text_informations_title ?></td>
						<td>
							<input type="text" name="seogen[informations_title_template]"
																	  value="<?php echo $seogen['informations_title_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_informations_title_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[informations_title_overwrite]" <?php if (isset($seogen['informations_title_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['informations_meta_keyword_template'])) { ?>
					<tr>
						<td><?php echo $text_informations_meta_keyword ?></td>
						<td>
							<input type="text" name="seogen[informations_meta_keyword_template]"
																	  value="<?php echo $seogen['informations_meta_keyword_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_informations_meta_keyword_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[informations_meta_keyword_overwrite]" <?php if (isset($seogen['informations_meta_keyword_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<?php if(isset($seogen['informations_meta_description_template'])) { ?>
					<tr>
						<td><?php echo $text_informations_meta_description ?></td>
						<td>
							<input type="text" name="seogen[informations_meta_description_template]"
																	  value="<?php echo $seogen['informations_meta_description_template']; ?>"><br/>
							<?php echo $text_available_tags . ' <span class="bold">' . $text_informations_meta_description_tags . '</span>'; ?>
						</td>
						<td>
							<input class="overwrite" type="checkbox" name="seogen[informations_meta_description_overwrite]" <?php if (isset($seogen['informations_meta_description_overwrite'])) echo "checked='checked'"; ?>>
						</td>
					</tr>
						<?php } ?>
					<tr>
						<td colspan="3"><a onclick="generate('informations');" class="button"><?php echo $text_generate; ?></a></td>
					</tr>
					</tbody>
				</table>
			</form>
			<a id="generate_url" style="display: none" href="<?php echo $generate?>"></a>
			<script type="text/javascript">
				function generate(selector) {
					$(".success").remove();
					var data = $('#' + selector + ' :input').serialize()
							+ '&name=' + selector;
					$.post($('#generate_url').attr('href'), data, function(html) {
						$(".breadcrumb").after('<div class="success">' + html + '</div>');
					});
				}
				$('#seogen_overwrite').change(function(){
					$('.overwrite').prop('checked', $(this).prop('checked'))
				});


$(document).ready(function() {
$(".seogen-list tr:even").css("background-color", "#F4F4F8");
});
			</script>
		</div>
	</div>
copyright &copy; <a href="mailto:ruslan.shv@gmail.com">Ruslan Shvarev</a>
<?php echo $footer; ?>