
	function getURLVar(key) {
		var value = [];

		var query = String(document.location).split('?');

		if (query[1]) {
			var part = query[1].split('&');

			for (i = 0; i < part.length; i++) {
				var data = part[i].split('=');

				if (data[0] && data[1]) {
					value[data[0]] = data[1];
				}
			}

			if (value[key]) {
				return value[key];
			} else {
				return '';
			}
		}
	}



	function validateForm(){

		var regExpName = /^[a-zA-Zа-яА-Я]+$/;
		var regExpEmail = /^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$/;
		var regExpPhone = /^\+\d{2}\(\d{3}\)\d{3}-\d{2}-\d{2}$/;
		
		var alert = '';

		var message = $('#inputMessage').val();
		var name = $('#inputName').val();
		var phone = $('#inputPhone').val();
		var email = $('#inputEmail').val();
		
		
				if(name.length > 1 && name != ''/* && regExpName.test(name)*/);
				else alert += ' Имя ';
			
				if(email.length > 2 && email != '' && regExpEmail.test(email));
				else alert += ' E-mail ';
				
				if(phone.length > 3 && phone != ''/* && regExpPhone.test(phone)*/);
				else alert += ' Телефон ';			

				if(message.length > 3 && message != '');
				else alert += ' Сообщение ';	

		if(alert == '') return '';
		else return 'Не верно заполнены данные: '+ alert;
	}	



	function menuAutoWidthItem(){
		var menuWidth = $('.container').width();
		if (true){
			var quantity = $('.main-navigation > li:visible').size();
			var homeicon = $('.homeicon:visible').outerWidth(true);
				if (homeicon){
					var res = (menuWidth-homeicon)/(quantity-1);
					$('.main-navigation > li:visible:not(.homeicon)').css('width',res*0.99);
					
				}else{
					var res = (menuWidth)/(quantity);
					$('.main-navigation > li:visible:not(.homeicon)').css('width',res*0.99);
				}
			$('#menu.main-menu > ul > li > a').css('max-width', '100%');
		}
	}

		/*Auto mirror left side submenu. mir = 2 half*/
	function menuHalfMirror(mir){
		if (mir === undefined) 	mir = 1.5;	 
		var startShift = Math.ceil($('#menu > ul > li:visible').size() / mir) + 1;
		var endShift = $('#menu > ul > li:visible').size();
		for(startShift; startShift <= endShift; startShift++){
			var shift = $('#menu > ul > li:visible:nth-child(' + startShift + ') > div').css('width').replace('px','') - $('#menu > ul > li:visible:nth-child(' + startShift + ')').css('width').replace('px','');	
			$('#menu > ul > li:visible:nth-child(' + startShift + ') > div').css('left', -shift);
		}
	}	

	$(document).ready(function() {

	$('.review-rating .reviews').click(function() {	$('ul.nav-tabs').ScrollTo();});

	$('.callform a').click(function() {	
		yaCounter37979225.reachGoal('callform');
		ga('send','event','Form', 'Send', 'CallForm');
	});

	$('#button-cart').click(function() {	
		yaCounter37979225.reachGoal('buy_button');
		ga('send','event','Button', 'Click', 'BuyButton');
	});

	$('a.callme').click(function() {	
		yaCounter37979225.reachGoal('callme');
		ga('send','event','Button', 'Click', 'Callme');
	});

	/*Auto set main menu item width*/	
	menuAutoWidthItem();
	menuHalfMirror();
		
	$(window).resize(function() {
		menuAutoWidthItem();
		menuHalfMirror();
	});
		
	

	/*Callback modal window*/	
	$('#sendModalButton').click (function(event) {

		var validate = validateForm();
		if(validate != '') $('#alertModal').text(validate);
		else {
			$('#alertModal').text('');

			  var sendmail = $.ajax({
			  url: "index.php?route=common/callback/sendmailCustom",
			  type: 'post',
			  data: {message : $('#inputMessage').val(),
					 name : $('#inputName').val(),
					 phone : $('#inputPhone').val(),
					 email : $('#inputEmail').val(),
					 subject : $('#inputSubject option:selected').html(),
					 },
				 dataType: 'json',
				 });
			 
				sendmail.done(function(msg) {
				if(msg == 1){
					$('.form-horizontal').attr('hidden', true);
					$('.modal-footer').attr('hidden', true);
					$('.successwindow').removeAttr('hidden');
				} 
				else alert( 'Ошибка!' + msg); 		   
			});
			 
			sendmail.fail(function(jqXHR, textStatus) { 
			  alert( "Request failed: " + textStatus );
			});
		}
	});  
	 
	 $('#closeModalButton').click (function(event) { 
			setTimeout(function() { 
				$('.form-horizontal').removeAttr('hidden');
				$('.modal-footer').removeAttr('hidden');
				$('.successwindow').attr('hidden', true); }, 1000);
	});
	
	/*Autoset option for Radio*/
	$('.form-group div[id^=input-option]').each(function(){
		$(this).find('input:first').attr('checked', '');
	});
	/*Autoset option  for Select*/
	$('.form-group select[id^=input-option]').each(function(){
		$(this).find('option:first').attr('disabled', 'disabled');
	  $(this).find('option:first + option').attr('selected', 'selected');
		var selectedOption = $(this).find('option[selected]').text();
		$(this).next().find('span').text(selectedOption);
	});

	
	
	
	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();
		
		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});
		
	// Currency
	$('#currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('#currency input[name=\'code\']').attr('value', $(this).attr('name'));

		$('#currency').submit();
	});

	// Language
	$('#language a').on('click', function(e) {
		e.preventDefault();

		$('#language input[name=\'code\']').attr('value', $(this).attr('href'));

		$('#language').submit();
	});

	/* Search */
	$('#search input[name=\'search\']').parent().find('button').on('click', function() {
		
		$(this).css('background', '#79b438');
		url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('header input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value) + '&description=true';
		}

		location = url;
	});

	$('#search input[name=\'search\']').on('keydown', function(e) {
		
		if (e.keyCode == 13) {
			$('header input[name=\'search\']').parent().find('button').trigger('click');
		}
	});

	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// Product List
	$('#list-view').click(function() {
		$('#content .product-grid > .clearfix').remove();

		 //$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');
		$('#content .product-grid').attr('class', 'product-layout product-list col-xs-12');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {

		// What a shame bootstrap does not take into account dynamically loaded columns
		cols = $('#column-right, #column-left').length;


		if (cols == 2) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-6 col-sm-12 col-xs-12');
			$('#content .product-layout:nth-child(3n+1)').attr('class', 'product-layout product-grid col-lg-3 col-md-6 col-sm-12 col-xs-12 first-item');
			$('#content .product-layout:nth-child(3n+3)').attr('class', 'product-layout product-grid col-lg-3 col-md-6 col-sm-12 col-xs-12 last-item');
		} else if (cols == 1) {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12');
			$('#content .product-layout:nth-child(4n+1)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 first-item');
			$('#content .product-layout:nth-child(4n+4)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 last-item');
			if (document.documentElement.clientWidth < 1200 && document.documentElement.clientWidth > 991) {
				$('#content .product-list').attr('class','product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12');
				$('#content .product-layout:nth-child(3n+1)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 first-item');
				$('#content .product-layout:nth-child(3n+3)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 last-item');
			}
			if (document.documentElement.clientWidth < 992 && document.documentElement.clientWidth > 767) {
				$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12');
				$('#content .product-layout:nth-child(2n+1)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 first-item');
				$('#content .product-layout:nth-child(2n+2)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 last-item');
			}
			if (document.documentElement.clientWidth < 768 && document.documentElement.clientWidth > 479) {
				$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12');
				$('#content .product-layout:nth-child(2n+1)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 first-item');
				$('#content .product-layout:nth-child(2n+2)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 last-item');
			}
			if (document.documentElement.clientWidth < 480) {
				$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-6 col-sm-12 col-xs-12 last-item');
			}
		} else {
			$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
			$('#content .product-layout:nth-child(4n+1)').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12 first-item');
			$('#content .product-layout:nth-child(4n+4)').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12 last-item');
			if (document.documentElement.clientWidth < 1200 && document.documentElement.clientWidth > 991) {
				$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12');
				$('#content .product-layout:nth-child(3n+1)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 first-item');
				$('#content .product-layout:nth-child(3n+3)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 last-item');
			}
			if (document.documentElement.clientWidth < 992 && document.documentElement.clientWidth > 767) {
				$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12');
				$('#content .product-layout:nth-child(2n+1)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 first-item');
				$('#content .product-layout:nth-child(2n+2)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 last-item');
			}
			if (document.documentElement.clientWidth < 768 && document.documentElement.clientWidth > 479) {
				$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12');
				$('#content .product-layout:nth-child(2n+1)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 first-item');
				$('#content .product-layout:nth-child(2n+2)').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-12 last-item');
			}
			if (document.documentElement.clientWidth < 480) {
				$('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-6 col-sm-12 col-xs-12 last-item');
			}
		}
		
		 localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	} else {
		$('#grid-view').trigger('click');
	}

	// Checkout
	$(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			$('#collapse-checkout-option #button-login').trigger('click');
		}
	});

	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});

	$('.cms_banner_left').click(function() {
		location.href = "http://market.zakupki.mos.ru/Supplier/Supplier?supplierId=6556849&from=sp_api_1_iregistered";
	});
});


// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},			
			success: function(json) {
				$('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
						$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '<i class="fa fa-angle-down"></i></span>');
					}, 100);

					$('html, body').animate({ scrollTop: 0 }, 'slow');

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},			
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '<i class="fa fa-angle-down"></i></span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
		complete: function() {
				$('#cart > button').button('reset');
			},			
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '<i class="fa fa-angle-down"></i></span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
					$('.container:has(#content)').load('index.php?route=checkout/cart/index .container:has(#content)'); // update cart
					$('.tooltip').each(function(){
						$(this).fadeOut(300);
					});
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
						$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '<i class="fa fa-angle-down"></i></span>');
					}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['redirect']) {
		location = json['redirect'];
			}

		if (json['success']) {
			$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
		}

				$('#wishlist-total span').html(json['total']);
				$('#wishlist-total').attr('title', json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'remove': function() {

	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#compare-total').html(json['total']);

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			},
	        error: function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	        }
		});
	},
	'remove': function() {

	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});

// Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();
	
			$.extend(this, option);
	
			$(this).attr('autocomplete', 'off');
			
			// Focus
			$(this).on('focus', function() {
				this.request();
			});
			
			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);				
			});
			
			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}				
			});
			
			// Click
			this.click = function(event) {
				event.preventDefault();
	
				value = $(event.target).parent().attr('data-value');
	
				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}
			
			// Show
			this.show = function() {
				var pos = $(this).position();
	
				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});
	
				$(this).siblings('ul.dropdown-menu').show();
			}
			
			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}		
			
			// Request
			this.request = function() {
				clearTimeout(this.timer);
		
				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}
			
			// Response
			this.response = function(json) {
				html = '';
	
				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}
	
					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}
	
					// Get all the ones with a categories
					var category = new Array();
	
					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}
	
							category[json[i]['category']]['item'].push(json[i]);
						}
					}
	
					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';
	
						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}
	
				if (html) {
					this.show();
				} else {
					this.hide();
				}
	
				$(this).siblings('ul.dropdown-menu').html(html);
			}
			
			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));	
			
		});
	}
})(window.jQuery);
