$(function(){

	var sectionFirst = $('#container').children('.hero-container:first');
	function scrollSectionHomepage() {
		if($('#container').hasClass('home-page') && $('.scroll-section').length) {
			var $btnScroll = $('.btn-scroll');
			var sectionTwoId = '#' + $('#container').children('section').eq(1).attr('id');
			$('.scroll-section').insertAfter(sectionFirst);
			if ($btnScroll.attr('href') !== sectionTwoId) {
				$btnScroll.attr('href', sectionTwoId);
			}
		}
	}
	scrollSectionHomepage();

	if( $('.btn-design').length == 0 ){
    	$('.sticky-nav .inner ul.nav').css('padding', '0px');
    }

	$('.btn-scroll').click(function(e) {
		var scrollSection;
		var hash = $(this).attr('href');
		if($('.order-status-section').length > 0) {
			var orderStatusHeight = $('.order-status-section').height();
		}
		else if($('.promo-header').length > 0) {
			var orderStatusHeight = $('.promo-header').height() + parseInt($('.promo-header').css('marginTop'));
		}
		else{
			var orderStatusHeight = 0;
		}
		if($(window).width() >= 960 && $('.sticky-nav').is(':visible')) {
			scrollSection = sectionFirst.height() + $('header').height() + orderStatusHeight;
		} else {
			scrollSection = sectionFirst.height() + orderStatusHeight;
		}
		e.preventDefault();
		$('html, body').animate({
			scrollTop: scrollSection
		}, 350, 'swing', function() {
			window.location.hash = hash;
		});
		console.log(hash);
	});

	function setScrollProperties() {
		if($('.scroll-section').prev().hasClass('story-section')) {
			$('.btn-scroll').addClass('dark');
		}
	}
	function setScrollPosition() {
        if($(document).scrollTop() === 0 && $(window).height() > 900) {
            $('.scroll-section').addClass('fixed');
        } else {
            $('.scroll-section').removeClass('fixed');
        }
    };
	function stickyNavSetup() {
		//console.log('stickyNavSetup running');
		if($('#container section').length < 2) {
			$('.scroll-section').remove();
		} else {
			setScrollProperties();
			setScrollPosition();
			$(window).resize(_.debounce(setScrollPosition, 200));
			$(window).scroll(_.debounce(setScrollPosition, 50));
		}
		if($('.sticky-nav ul.nav > li').length < 1 || $(window).width() < 960) {
			$('.sticky-nav').hide().removeClass('stuck');
		} else {
			$('.sticky-nav').show();
			//$('.sticky-wrapper').css('height','');
		}
		$(window).trigger('resize.waypoints');
	}

	stickyNavSetup();

	mo.resizeStickyNav = _.debounce(stickyNavSetup, 200);
	$(window).resize(_.debounce(stickyNavSetup, 200));

});
