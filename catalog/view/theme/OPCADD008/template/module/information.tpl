<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
	<div class="list-group">
			<?php foreach ($informations as $information) { ?>
				<?php if ($information['sort_order'] < 900) { ?>
					<a class="list-group-item" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
				<?php } ?>
			<?php } ?>
				<a class="list-group-item" href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
	
				<a class="list-group-item" href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
	</div>
</div>