
<?php
	$span = 12/$cols;
?>

<div class="box pav-block bloglatest">
	<div class="box-heading"><span><?php echo $heading_title; ?></span></div>
	<?php if( trim($message) ) { ?>
				<div class="box-description"><?php echo $message;?></div>
				<?php } ?>
		<?php if( !empty($blogs) ) { ?>
		<div class="pavblog-latest clearfix">
			<?php foreach( $blogs as $key => $blog ) { ?>
			<?php if( $key++%$cols == 0 ) { ?>
			<div class="row">
			<?php } ?>
				<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> pavblock">
					<div class="blog-item">
						<div class="blog-body clearfix">

							<div class="image clearfix">
								<?php if( $blog['thumb']  )  { ?>
								<a href="<?php echo $blog['link'];?>" ><img src="<?php echo $blog['thumb'];?>" alt="<?php echo $blog['title'];?>"></a>
								<?php } ?>
								<div class="ImageOverlayC"></div>
							</div>
							<div class="group-blog">
								<div class="blog-title clearfix">
									<a href="<?php echo $blog['link'];?>" title="<?php echo $blog['title'];?>"><?php echo $blog['title'];?></a>
								</div>
								<div class="blog-meta">
									<i class="fa fa-pencil"></i>
									<span class="created"><?php echo $blog['created'];?></span>
									<span class="author"><?php echo $blog['author'];?></span>
								</div>
								<div class="description">
									<?php echo utf8_substr( $blog['description'],0, 70 );?>...
								</div>

								<!--<p>
									<a href="<?php echo $blog['link'];?>" class="readmore button"><?php echo $this->language->get('text_readmore');?></a>
								</p> -->
							</div>

						</div>
					</div>
				</div>
			<?php if( ( $key%$cols==0 || $key == count($blogs)) ){  ?>
			</div>
			<?php } ?>
			<?php } ?>
		</div>
		<?php } ?>
	</div>

