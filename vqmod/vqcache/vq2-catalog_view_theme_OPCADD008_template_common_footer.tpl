
 <div class="content_footercms_top"><div class="container"><?php echo $footertop; ?></div> </div>
 <footer>

  <div id="footer" class="container">
     <div class="row">
			<div class="footer_link_left">
				<div class="column">
					<div class="content_footercms_left "><?php echo $footerleft; ?> </div>
				</div>
			</div>
			<div class="footer_link_center">
			
			<div class="footer_inner_link">
			
					 <div class="column">
					<h5><?php echo $text_account; ?></h5>
					<ul class="list-unstyled">
					  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
					  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
					  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
					</ul>
				  </div>
				  
				   <div class="column">
					<h5><?php echo $text_extra; ?></h5>
					<ul class="list-unstyled">
					  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>

				<li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
			
					  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
					  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
					</ul>
                   </div>
				  
				</div>
				<div class="footer_inner_link">  
				  
				   <div class="column">
					<h5><?php echo $text_service; ?></h5>
					<ul class="list-unstyled">
					  <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
					  <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
					  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
					    <!-- <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>

				<li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
			
					  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
					   <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>-->
					 <?php /*?> <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li><?php */?>
					</ul>
				  </div>
				  
				  </div>
			 
				 
				</div>
				
			<div class="footer_link_right">
					<div class="content_footercms_right "><?php echo $footerright; ?> </div>
			</div>
    </div>
	 </div>
   <div class="footer-bottom">
   		<div class="footer-bottominner">
   			<div class="footer-link">
				<ul>
					<li class="first"><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
					<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>

				<li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
			
					<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
					<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
					<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
					<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
					<li class="last"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
				</ul>
  		 </div>
   		
	<div id="powered" ><?php echo $powered; ?></div>
	<div class="content_footercms_bottom "><?php echo $footerbottom; ?> </div>
	</div>
 </div>
</footer>
<span class="testimonial_default_width" style="display: none; visibility: hidden;"></span>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function() {
            try {
                w.yaCounter37979225 = new Ya.Metrika({
                    id:37979225,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true,
                    webvisor:true
                });
            } catch(e) { }
        });

        var n = d.getElementsByTagName("script")[0],
            s = d.createElement("script"),
            f = function () { n.parentNode.insertBefore(s, n); };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else { f(); }
    })(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="https://mc.yandex.ru/watch/37979225" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-79407814-1', 'auto');
  ga('send', 'pageview');

</script>

<!-- Start SiteHeart code -->
<script>
(function(){
var widget_id = 842885;
_shcp =[{widget_id : widget_id}];
var lang =(navigator.language || navigator.systemLanguage 
|| navigator.userLanguage ||"en")
.substr(0,2).toLowerCase();
var url ="widget.siteheart.com/widget/sh/"+ widget_id +"/"+ lang +"/widget.js";
var hcc = document.createElement("script");
hcc.type ="text/javascript";
hcc.async =true;
hcc.src =("https:"== document.location.protocol ?"https":"http")
+"://"+ url;
var s = document.getElementsByTagName("script")[0];
s.parentNode.insertBefore(hcc, s.nextSibling);
})();

$(document).ready(function() { 
	$('.call_sh').click(function(event) {
			event.preventDefault();
			$('#sh_button').click();
	});
});
</script>
<!-- End SiteHeart code -->

</body></html>