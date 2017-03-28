<div class="box bestseller">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
	
	 <div class="mini-products-list normal-additional-carousel" id="block-bestseller">
  <?php foreach ($products as $product) { ?>
  <li class="slider-item">
		<div class="image">
			<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
	  <?php if (!$product['special']) { ?>       
			 <?php } else { ?>
			<span class="saleicon sale">Sale</span>         
			 <?php } ?>	
		</div>
		<div class="productright">
		
 			<h4><a href="<?php echo $product['href']; ?>" title="<?php echo ($product['name']); ?>">
					<?php if (strlen(($product['name'])) > 16)
					{ 
						//$maxLength = 16 ; echo substr($product['name'],0,$maxLength).".."; 
						echo ($product['name']);
					}
					else{
						echo ($product['name']);
					}
					?>
				</a>
				</h4>
		
			<?php if ($product['price']) { ?>
			<p class="price">
			  <?php if (!$product['special']) { ?>
			  <?php echo $product['price']; ?>
			  <?php } else { ?>
			  <span class="price-old"><?php echo $product['price']; ?></span><span class="price-new"><?php echo $product['special']; ?></span> 
			  <?php } ?>
			  <?php if ($product['tax']) { ?>
			  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
			  <?php } ?>
			</p>
			<?php } ?>
			</div>
			
			<?php if ($product['rating']) { ?>
			<div class="rating">
			  <?php for ($i = 1; $i <= 5; $i++) { ?>
			  <?php if ($product['rating'] < $i) { ?>
			  <span class="fa fa-stack"><i class="fa fa-star off fa-stack-2x"></i></span>
			  <?php } else { ?>
			  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
			  <?php } ?>
			  <?php } ?>
			</div>
			<?php } ?>
 	    
			
		<?php /*?><div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button" /></div><?php */?>
			
			</li>

<?php } ?>
    </div>
  </div>
</div>
<span class="bestseller_default_width" style="display:none; visibility:hidden"></span>

<script>
jQuery('.normal-additional-carousel').bxSlider({
mode: 'vertical',
minSlides: 5,
slideWidth:255


});
</script>