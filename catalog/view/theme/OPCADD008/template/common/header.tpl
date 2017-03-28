<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>

<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/stylesheet.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/carousel.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/custom.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/bootstrap.min.css" />


<?php if($direction=='rtl'){ ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $mytemplate; ?>/stylesheet/megnor/rtl.css">
<?php }?>

<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<!-- Megnor www.templatemela.com - Start -->
<script type="text/javascript" src="catalog/view/javascript/megnor/custom.js"></script>
<script type="text/javascript" src="catalog/view/javascript/megnor/jstree.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/megnor/carousel.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/megnor/megnor.min.js"></script>
<script src="catalog/view/javascript/megnor/tabs.js" type="text/javascript"></script>
<script type="text/javascript" src="catalog/view/javascript/megnor/jquery.custom.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/megnor/jquery.formalize.min.js"></script> 
<script type="text/javascript" src="catalog/view/javascript/megnor/jquery.bxslider.min.js"></script>
<!-- Megnor www.templatemela.com - End -->
<script type="text/javascript" src="catalog/view/javascript/jquery-scrollto/jquery-scrollto.js"></script>

<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
	<link rel="shortcut icon" href="http://ortopedshop.ru/favicon.ico" type="image/x-icon">
	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>

<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>

<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
	<?php echo $analytic; ?>
	<?php } ?>
</head>

<?php if ($column_left && $column_right) { ?>
<?php $layoutclass = 'layout-3'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php if ($column_left){ ?>
<?php $layoutclass = 'layout-2 left-col'; ?>
<?php } elseif ($column_right) { ?>
<?php $layoutclass = 'layout-2 right-col'; ?>
<?php } ?>
<?php } else { ?>
<?php $layoutclass = 'layout-1'; ?>
<?php } ?>

<body class="<?php echo $class;echo " " ;echo $layoutclass; ?>">


<!-- start Modal mail form -->

<style>
.modal-backdrop{
	z-index: 10;
	}
</style>


		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h3 class="modal-title text-info" id="myModalLabel">Форма обратной связи</h3>
			  </div>
			  <div class="modal-body">				
				<form class="form-horizontal">
					  <div class="control-group">
						<label class="control-label" for="inputName">Имя</label>
						<div class="controls">
						  <input type="text" id="inputName" placeholder=" Ваше имя">
						</div>
					  </div>	  
					  <div class="control-group">
						<label class="control-label" for="inputPhone">Телефон</label>
						<div class="controls">
						  <input type="text" id="inputPhone" placeholder=" Ваш номер телефона">
						</div>
					  </div>					  
					  <div class="control-group">
						<label class="control-label" for="inputEmail">Email</label>
						<div class="controls">
						  <input type="text" id="inputEmail" placeholder=" Адрес e-mail">
						</div>
					  </div>					  
					  <div class="control-group">
						<label class="control-label" for="inputSubject">Тема обращения</label>
						<div class="controls">
						  	<select id="inputSubject">
						  	  <option>Нашли дешевле</option>
							  <option>Консультация специалиста</option>
							  <option>Наличие товара</option>
							  <option>Доставка</option>
							  <option>Заказ</option>
							  <option>Возврат и обмен</option>
							  <option>Сотрудничество</option>
							</select>
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" for="inputMessage">Сообщение</label>
						<div class="controls">
						  <textarea id="inputMessage" rows="3"></textarea>
						</div>
					  </div>					  
				</form>
				<div class="successwindow" hidden="hidden">
					<h3>Спасибо!</h3>
					<p>Мы очень благодарны Вам за проявленный интерес к нашей компанни и признательны за оказанное доверие</p>
					<p>Наш менеджер свяжется с Вами в кратчайшие сроки.</p>
					<br>
				    <button type="button" class="btn btn-default" data-dismiss="modal" id="closeModalButton">Закрыть</button>
				</div>
			  </div>
			  <div class="modal-footer">
			  <label class="control-label" id="alertModal"></label>
				<button type="button" class="btn btn-primary" id="sendModalButton">Отправить</button>
			  </div>
			</div>
		  </div>
		</div>

<!-- end Modal mail form -->

<nav id="top">
  <div class="container">
  	<?php echo $language; ?>
    <?php echo $currency; ?>
    
    <din class="nav pull-left info-top">Прием и обработка заказов с 9-00 до 20-00</din>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <?php /*?><li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li><?php */?>
        <li class="dropdown myaccount"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right myaccount-menu">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span><?php echo $text_wishlist; ?></span></a></li>
        
<?php /*?>        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
<?php */?>      </ul>
    </div>
  </div>
</nav>

<div class="header">
<header>
  <div class="container">

	<div class="header-left">
      <div class="logo">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
	  </div>
	  <div class="header-right">
	  <div class="content_headercms_top"><?php echo $headertop; ?> 
		<div class="callform"><a rel="nofollow" onclick="$('#myModal').modal('show');">Форма обратной связи</a></div>
		<!-- -->
	  </div>
		  <div class="search"><?php echo $search; ?></div>
		  <div class="cart"><?php echo $cart; ?></div>
	  </div>
   	<div class="pull-right theme-color-2">Бесплатная примерка в любом удобном для вас месте!</div>
  </div>
</header>
<nav class="nav-container" role="navigation">
<div class="nav-inner">
<!-- ======= Menu Code START ========= -->
<?php if ($categories) { ?>
<!-- Opencart 3 level Category Menu-->
<div class="container">
<div id="menu" class="main-menu">
  <ul class="main-navigation">
   <li class="homeicon"> <a href="#"></a></li>
   <?php foreach ($categories as $category_1) { ?>
		<li>
			<a href="<?php echo $category_1['href']; ?>" class="<?php if ($category_1['children']) { echo "subcategory";}else{echo "single";}?>"><?php echo $category_1['name']; ?></a>
  			 <?php if ($category_1['children']) { ?>
			   <?php $i = count($category_1['children']); ?>
				
					<div class="categorybg">
						 <div class="categoryinner">
        					
								<ul>
								<?php $i=1; ?>
								<?php foreach ($category_1['children'] as $category_2) { ?>
								<li class="categorycolumn"><b><a class="submenu1" href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a></b>
								  <?php if($category_2['children']) { ?>
									<?php $j = count($category_2['children']); ?>
									<?php if($j<=10) { ?>
									<div>
									  <ul>
										 <?php foreach ($category_2['children'] as $category_3) { ?>
										 <li style="padding-right:6px;"><a class="submenu2" href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
										 <?php } ?>
									  </ul>
									</div>
									<?php } else { ?>
									<div>
									  <ul>
									  <?php $j=0; ?>
										 <?php foreach ($category_2['children'] as $category_3) { ?>
										 <li style="padding-right:6px;"><a class="submenu2" href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
										 <?php if (++$j == 10) ?>
										 <?php } ?>
										 <li style="padding-right:6px;"><a class="submenu2" href="<?php echo $category_2['href']; ?>"><?php echo $text_more; ?></a></li>
									  </ul>
									</div>
									<?php } ?>
								</li>
								<?php } ?>

								<?php } ?>
								
								</ul>
								
				
		
							
						</div>
					</div>
				
				<?php } ?>
	  		<?php } ?>
	  	</li>
		
		
		<?php /*?><li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li><?php */?>
   
   
   
   
  </ul>
</div>
<?php } ?>
<!-- ======= Menu Code END ========= -->
</div>
</div>
<div id="res-menu" class="main-menu nav-container1">
<div class="res-menu-inner">
<div class="container res-menu">
	<div class="nav-responsive"><span>Меню</span><div class="expandable"></div></div>
     <ul class="main-navigation">
      <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>

        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>										
				<li>
				<?php if(count($category['children'][$i]['children'])>0){ ?>
					<a href="<?php echo $category['children'][$i]['href']; ?>" class="activSub" <?php /*?>onmouseover='JavaScript:openSubMenu("<?php echo $category['children'][$i]['id']; ?>")'<?php */?>><?php echo $category['children'][$i]['name'];?></a> 					
				<?php } else { ?>				
					<a href="<?php echo $category['children'][$i]['href']; ?>" <?php /*?>onmouseover='JavaScript:closeSubMenu()'<?php */?> ><?php echo $category['children'][$i]['name']; ?></a>
				<?php } ?>

				<?php if ($category['children'][$i]['children']) { ?>
				<?php /*?><div class="submenu" id="id_menu_<?php echo $category['children'][$i]['id']; ?>"><?php */?>
				<ul>
				<?php for ($wi = 0; $wi < count($category['children'][$i]['children']); $wi++) { ?>
					<li><a href="<?php echo $category['children'][$i]['children'][$wi]['href']; ?>"  ><?php echo $category['children'][$i]['children'][$wi]['name']; ?></a></li>
				 <?php } ?>
				</ul>
				<?php /*?></div><?php */?>
			  <?php } ?>		  
			</li>		
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>

      <?php } ?>
    </li>
    <?php } ?>
    </ul>
	</div>
</div>

</div> 

</nav>   

</div>




