<div class="hometab">
<div id="tabs" class="htabs">
  <ul class='etabs'>
	<li class='tab'>
		<?php if($bestsellersproducts){ ?>
		<a href="#tab-bestseller"><?php echo $tab_bestseller; ?></a>
		<?php } ?>
	</li>
	<li class='tab'>
		<?php if($latestproducts){ ?>
			<a href="#tab-latest"><?php echo $tab_latest; ?></a>
		<?php } ?>
	</li>
	<li class='tab'>
		<?php if($specialproducts){ ?>
			<a href="#tab-special"><?php echo $tab_special; ?></a>
		<?php } ?>
	</li>
	</ul>
 </div>
<?php if($bestsellersproducts){ ?>
 <div id="tab-bestseller" class="tab-content">
    	  <div class="box">
				<div class="box-content">
					<?php 
						$sliderFor = 5;
						$productCount = sizeof($bestsellersproducts); 
					?>
					<?php if ($productCount >= $sliderFor): ?>
						<div class="customNavigation">
							<a class="fa prev fa-angle-left">&nbsp;</a>
							<a class="fa next fa-angle-right">&nbsp;</a>
						</div>	
					<?php endif; ?>	
					
					<div class="box-product <?php if ($productCount >= $sliderFor){?>product-carousel<?php }else{?>productbox-grid<?php }?>" id="<?php if ($productCount >= $sliderFor){?>tabbestseller-carousel<?php }else{?>tabbestseller-grid<?php }?>">
						<?php foreach ($bestsellersproducts as $product) { ?>
							<div class="<?php if ($productCount >= $sliderFor){?>slider-item<?php }else{?>product-items<?php }?>">
								<div class="product-block product-thumb transition">
									<div class="product-block-inner">
										
										<div class="image">
											<a href="<?php echo $product['href']; ?>">
												<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />	
												
											</a>
											<?php if (!$product['special']) { ?>       
											<?php } else { ?>
												<span class="saleicon sale">Sale</span>         
											<?php } ?>	
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
										
										
										<div class="button-group">
											<button class="cart_button"  type="button"  title="<?php echo $button_cart; ?>" data-toggle="tooltip"   onclick="cart.add('<?php echo $product['product_id']; ?>');"> <?php echo $button_cart; ?></button>
											<button class="wishlist_button" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></button>
											<button class="compare_button" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"></button>
										</div>
										
										</div>
										
										<div class="caption">
											<div class="product-name">
											<h4><a href="<?php echo $product['href']; ?>" title="<?php echo ($product['name']); ?>">
												<?php if (strlen(($product['name'])) > 20)
												{ 
													//$maxLength = 20 ; echo substr($product['name'],0,$maxLength).".."; 
													echo ($product['name']);
												}
												else{
													echo ($product['name']);
												}
												?>
											</a>
											</h4>
											</div>
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
										
									</div>
								</div>
							</div>
						<?php } ?>
					</div>
				</div>
			 </div>
		 <span class="tabbestseller_default_width" style="display:none; visibility:hidden"></span> 
 </div>
<?php } ?>
<?php if($latestproducts){ ?>
<div id="tab-latest" class="tab-content">
	<div class="box">
				<div class="box-content">
					<?php 
						$sliderFor = 5;
						$productCount = sizeof($latestproducts); 
					?>
						<?php if ($productCount >= $sliderFor): ?>
						<div class="customNavigation">
							<a class="fa prev fa-angle-left">&nbsp;</a>
							<a class="fa next fa-angle-right">&nbsp;</a>
						</div>	
					<?php endif; ?>	
					<div class="box-product <?php if ($productCount >= $sliderFor){?>product-carousel<?php }else{?>productbox-grid<?php }?>" id="<?php if ($productCount >= $sliderFor){?>tablatest-carousel<?php }else{?>tablatest-grid<?php }?>">
						<?php foreach ($latestproducts as $product) { ?>
										<div class="<?php if ($productCount >= $sliderFor){?>slider-item<?php }else{?>product-items<?php }?>">
								<div class="product-block product-thumb transition">
									<div class="product-block-inner">
										
										<div class="image">
											<a href="<?php echo $product['href']; ?>">
												<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />		
												
												
											</a>
											<?php if (!$product['special']) { ?>       
											<?php } else { ?>
												<span class="saleicon sale">Sale</span>         
											<?php } ?>	
											
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
											
											
											<div class="button-group">
											<button class="cart_button" data-toggle="tooltip"  title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>
											<button class="wishlist_button" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></button>
											<button class="compare_button" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"></button>
										</div>
											
											
										</div>
										
										
										
										
										
										<div class="caption">
										<div class="product-name">
											<h4><a href="<?php echo $product['href']; ?>" title="<?php echo ($product['name']); ?>">
												<?php if (strlen(($product['name'])) > 20)
												{ 
													//$maxLength = 20 ; echo substr($product['name'],0,$maxLength).".."; 
													echo ($product['name']);
												}
												else{
													echo ($product['name']);
												}
												?>
											</a></h4>
											</div>
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
										
									</div>
								</div>
							</div>
						<?php } ?>
					</div>
				</div>
			 </div>
			  <span class="tablatest_default_width" style="display:none; visibility:hidden"></span>
 </div>
<?php } ?>
<?php if($specialproducts){ ?>
 <div id="tab-special" class="tab-content">
    	 <div class="box">
				<div class="box-content">
					<?php 
						$sliderFor = 5;
						$productCount = sizeof($specialproducts); 
					?>
					<?php if ($productCount >= $sliderFor): ?>
						<div class="customNavigation">
							<a class="fa prev fa-angle-left">&nbsp;</a>
							<a class="fa next fa-angle-right">&nbsp;</a>
						</div>	
					<?php endif; ?>	
					<div class="box-product <?php if ($productCount >= $sliderFor){?>product-carousel<?php }else{?>productbox-grid<?php }?>" id="<?php if ($productCount >= $sliderFor){?>tabspecial-carousel<?php }else{?>tabspecial-grid<?php }?>">
						<?php foreach ($specialproducts as $product) { ?>
							<div class="<?php if ($productCount >= $sliderFor){?>slider-item<?php }else{?>product-items<?php }?>">
								<div class="product-block product-thumb transition">
									<div class="product-block-inner">
										<div class="image">
											<a href="<?php echo $product['href']; ?>">
												<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />					</a>
											<?php if (!$product['special']) { ?>       
											<?php } else { ?>
												<span class="saleicon sale">Sale</span>         
											<?php } ?>	
											
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
											
										
										
										<div class="button-group">
											<button class="cart_button" data-toggle="tooltip"   title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>
											<button class="wishlist_button" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"></button>
											<button class="compare_button" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"></button>
										</div>
										
										</div>
										
										<div class="caption">
										<div class="product-name">
											<h4><a href="<?php echo $product['href']; ?>" title="<?php echo ($product['name']); ?>">
												<?php if (strlen(($product['name'])) > 20)
												{ 
													//$maxLength = 20 ; echo substr($product['name'],0,$maxLength).".."; 
													echo ($product['name']);
												}
												else{
													echo ($product['name']);
												}
												?>
											</a></h4>
											</div>
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
				
										
			  
									</div>
								</div>
							</div>
						<?php } ?>
					</div>
				</div>
			 </div>
		 <span class="tabspecial_default_width" style="display:none; visibility:hidden"></span> 
 </div>
<?php } ?>
</div>
<script type="text/javascript">
$('#tabs a').tabs();
</script> 