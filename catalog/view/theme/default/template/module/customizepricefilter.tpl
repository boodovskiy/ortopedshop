<script src="catalog/view/javascript/noUiSlider/nouislider.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/noUiSlider/nouislider.min.css" rel="stylesheet">
<link href="catalog/view/javascript/noUiSlider/nouislider.pips.css" rel="stylesheet">
<div class="contenta">
<?php
if (!function_exists('curPageURL')) {
function curPageURL() {
$pageURL = 'http';
if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') {$pageURL .= "s";}
$pageURL .= "://";
if ($_SERVER["SERVER_PORT"] != "80") {
$pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
} else {
$pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
}
return $pageURL;
}
}
?>
<style>.tooltip {
	opacity:1;
	display: block;
	position: absolute;
	border: 1px solid #D9D9D9;
	font: 400 12px/12px Arial;
	border-radius: 3px;
	background: #fff;
	top: -25px;
	padding: 5px;
	left: -9px;
	text-align: center;
	width: 50px;
}
.tooltip strong {
	display: block;
	padding: 2px;
}
.noUi-vertical
{
height:200px;
margin-left:50px;
<?php if($customizepricefilter_thickness) echo "width:$customizepricefilter_thickness"."px;"; ?>
}
.noUi-horizontal
{

<?php if($customizepricefilter_thickness) echo "height:$customizepricefilter_thickness"."px;"; ?>
}
.btn
{
padding: 1px 1px;
font-size: 12px;
}
<?php if($customizepricefilter_button_color)
{
?>
.noUi-handle
{
	background: <?php echo $customizepricefilter_button_color;?>;
	width:20px;
}
<?php 
}
?>
<?php if($customizepricefilter_filled_color)
{
?>
.noUi-connect
{
	background: <?php echo $customizepricefilter_filled_color;?>;
}
.button-hide
{
float: right;
display: none;
}
<?php 
}
?>
</style>
<div class="box">
		<div class="box-heading" style="color:hsl(0, 0%, 33%)"><?php echo $text_filter_price; ?><span <?php if(!$customizepricefilter_reset_button) echo"style='float:right;display:none;'"; else echo"style='float:right;display:block;'"; ?> onclick=resetslider();><button class="btn btn-primary" >Cброс</button></span></div>
	        <div class="box-content" style='padding:30px 20px 20px;width:auto;height:auto;'>
				
	           <div id="range"></div>

	        </div>
	    </div>
   
<script>
 var target;
  $(function() 
  {
    var queryString = window.location.search;
    if  (queryString.indexOf("route") != -1)
     {
       target='<?php echo $target;?>';
      } else {
      target='<?php echo curPageURL();?>';
      }
  
   var slider = document.getElementById('range');

noUiSlider.create(slider, {
	start: [ <?php echo $lowerlimit;?>, <?php echo $upperlimit;?> ], // Handle start position
	step: <?php echo $customizepricefilter_step;?>, // Slider moves in increments of '10'
	margin: <?php echo $customizepricefilter_margin;?>, // Handles must be more than '20' apart
	connect: true, // Display a colored bar between the handles
	direction: "<?php echo $customizepricefilter_direction;?>", // Put '0' at the bottom of the slider
	orientation: "<?php echo $customizepricefilter_orientation;?>", // Orient the slider vertically
	//orientation: 'horizontal',
	
	behaviour: 'tap', // Move handle on tap, bar is draggable
	range: { // Slider can select '0' to '100'
		'min': <?php echo $min ?>,
		'max': <?php echo $max ?>
	},
	pips: { // Show a scale with the slider
		mode: 'count',
		values: 5,
		density: 5,
		stepped: true

	}
});
var tipHandles = slider.getElementsByClassName('noUi-handle'),
	tooltips = [];


for ( var i = 0; i < tipHandles.length; i++ ){
	tooltips[i] = document.createElement('div');
	tipHandles[i].appendChild(tooltips[i]);
	tooltips[i].className += 'tooltip';
	tooltips[i].innerHTML = '<span></span>';
	tooltips[i] = tooltips[i].getElementsByTagName('span')[0];
}
slider.noUiSlider.on('update', function( values, handle ){
	tooltips[handle].innerHTML = Math.floor(values[handle]);
	console.log(values[handle]);
});
slider.noUiSlider.on('change', function( values, handle ){
	
	$.ajax({
				
				url:'<?php echo $target;?>',
				dataType:'html',
				type: 'get',
				data:{ lower:values[ 0 ], higher:values[ 1 ]},
				success: function(data) {
				<?php if($theme) { ?>
				   $('#backend').html(data);
				   <?php 
			   } 
			   else
			   {
			   ?>
			   location.reload();
			  <?php }?>
				   
				}
                                
			    }); 
			   
			    
});
 }
  );
  function resetslider() {
  var slider = document.getElementById('range');
  slider.noUiSlider.set([<?php echo $min;?>, <?php echo $max;?>]);
  
	$.ajax({
			
				url:'<?php echo $target;?>',
				dataType:'html',
				type: 'get',
				data:{ lower:<?php echo $min;?>, higher:<?php echo $max;?>},
				success: function(html) {
				 <?php if($theme) { ?>
				  $('#backend').html(html);
				  
				  <?php 
			   } 
			   else
			   {
			   ?>
			   location.reload();
			  <?php }?>
			  
				}
                                
			    }); 
			  

}
</script>		



</div>
