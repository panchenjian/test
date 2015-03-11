$(function(){
    /**
    * Header Functionality (header.js)
    * @class header.js
    */

    var headerRow = $('header.row');
    $('html').addClass('header-locked');
    headerRow.addClass('locked');
    if ( $("#accessories-recommendations-wrapper .in-grid").is(":visible") && $("#motomaker-container").is(":visible") ) {

         $("a[href='#MotoX-accessories-group']").parent().show();
    }
    if ( !$("#accessories-recommendations-wrapper .in-grid").is(":visible") || !$("#motomaker-container").is(":visible") ) {
        $("a[href='#MotoX-accessories-group']").parent().hide();
    }

    $(window).on('scroll', function(e){
        if($(window).width() >= 960 && $('.sticky-nav').is(':visible')) {
            var windowScroll = $(window).scrollTop(),
                headerHeight = $('header').height();

                if($('.sticky-wrapper').length > 0){
                    var stickyNavOffset = $('.sticky-wrapper').offset().top;
                }

                if ((windowScroll + headerHeight) < stickyNavOffset)  {
                    if (headerRow.hasClass('nailed')){
                        headerRow.removeClass('nailed').css('top', '');
                    }
                } else {
                    var headerBaseOffset = stickyNavOffset - headerHeight,
                        headerOffset = stickyNavOffset - headerHeight;

                    headerRow.addClass('nailed').css('top', headerOffset + 'px');
                }
                if (stickyNavOffset <= windowScroll) {//pcj add
                    $('.sticky-nav').addClass('stuck');
                } else {
                    $('.sticky-nav').removeClass('stuck');
                }
        }
    });

    /**
    * Release header
    * @method releaseHeader
    */
    function releaseHeader() {
        if($(window).width() < 960 && $('header.locked').hasClass('nailed')) {
            $('header.locked').removeClass('nailed').css('top', '');
        }
    }

    /**
    * Resize Hero
    * @method resizeHero
    */
    function resizeHero() {
        var navHeight,
            stickyNav = $('.sticky-nav'),
            stickyNavHeight = stickyNav.outerHeight(),
            windowWidth,
            windowHeight,
            newHeroHeight,
            stickyHeroHeight,
            smallHeroHeight,
            smallStickyHeroHeight,
            descriptionHeight,
            firstSectionCards = $('#container').children('.hero-container').find('.card-size'),
            otherCards = $('#container').children('.card-url').find('.card-size'),
            allCards = $('.card-size');
        navHeight = $('nav').height();
        windowWidth = $(window).width();
        windowHeight = $(window).height();
        newHeroHeight = windowHeight - navHeight;
        smallHeroHeight = 700 - navHeight;
        if(windowWidth > windowHeight) {
            if(windowWidth >= 960 && stickyNav.is(':visible')) {
                stickyHeroHeight = windowHeight - stickyNavHeight;
                smallStickyHeroHeight = 700 - stickyNavHeight;
                if(windowHeight > 700) {
                    firstSectionCards.height(newHeroHeight);
                    otherCards.height(stickyHeroHeight);
                } else {
                    firstSectionCards.height(smallHeroHeight);
                    otherCards.height(smallStickyHeroHeight);
                }
            } else if(windowWidth >= 500 && stickyNav.not(':visible')) {
                if(windowHeight > 700) {
                    allCards.height(newHeroHeight);
                } else {
                    allCards.height(smallHeroHeight);
                }
            }
        } else if(windowWidth >= 500 && windowWidth < 787) {
            allCards.height(smallHeroHeight);
        } else if(windowWidth <= 500) {
            allCards.height('auto');
        }
        allCards.each(function() {
            descriptionHeight = $(this).find('.description').outerHeight();
            if(descriptionHeight > $(this).height()) {
                $(this).height(descriptionHeight);
            }
        });

        if($('.pdp-scrolling-container').length > 0){
            $(document).ready(function(){
                mo.pdpScroll.init();
                if(!mo.pdpScroll.checkMobile()){
                    skrollr.init().refresh();
                }
            });
        }
    }
    resizeHero();

    /**
    * Initialize Promo Bar and Positioning
    * @method _initializePromoBar
    * @private
    */
    function _initializePromoBar() {

        var $contentContainers,
            $firstHeroNav,
            $headerHeight,
            $promoHeaderHeight,
            firstHeroNavHeight;

        $contentContainers = $('.header-locked #container, .header-locked body>.page, .header-locked .search-results');
        $firstHeroNav = $contentContainers.find('.carousel').first().find('.pagination');
        $headerHeight = $('header.locked').height();
        $promoHeaderHeight = $('.promo-header').height();

        // Calculating different heights for mobile and desktop to resolve IKSALEMRKT-5869
        firstHeroNavHeight = ($(window).width() < 500) ? $promoHeaderHeight : 30 + $promoHeaderHeight;

        $firstHeroNav.css({
            'bottom': firstHeroNavHeight + 'px'
        });

        $contentContainers.css({
            'margin-top': $headerHeight + 'px'
        });
    }

    /**
    * Handle Promo Bar dismiss button
    * @method _initializePromoBar
    * @private
    */

    function _handlePromoBarClick(e) {

        e.preventDefault();

        var $contentContainers,
            $promoHeaderHeight,
            $headerHeight,
            $firstHeroNav,
            $navHeight,
            removeBarUrl;

        $contentContainers = $('.header-locked #container, .header-locked body>.page, .header-locked .search-results, .header-locked #motomaker');
        $promoHeaderHeight = $('.promo-header').height();


        $(this).parents('section.promo-header').animate({'margin-top': -$promoHeaderHeight}, 200);
        $headerMargin = parseInt($('.confirmation-thank-you .thank-you h3').css('margin-top'));
        $('.confirmation-thank-you .thank-you h3').animate({'margin-top': $headerMargin-$promoHeaderHeight}, 200);

        $headerHeight = $('header.locked').height();
        $firstHeroNav = $contentContainers.find('.carousel:first-child .pagination');
        $navHeight= $('header nav').height();
        $firstHeroNav.animate({'bottom': 30}, 200);
        $contentContainers.animate({'margin-top': $navHeight}, 200);

        /**
        * Set removeBarUrl value
        * @property removeBarUrl
        * @type String
        */
        removeBarUrl = mo.getServiceUrl('UTIL_SVC_HeaderPromoBar-RemovePromoBar');

        $.ajax({
          url: removeBarUrl
        }).done(function() {

        })
    }

    /**
    * Handle Window Resize
    * @method _handleWindowResize
    * @param {e} Event of the event object
    * @private
    */

    function _handleWindowResize(e) {
        resizeHero();
        _initializePromoBar();
        releaseHeader();
    }
    _initializePromoBar();

    // function to handle the click/dismiss event of the new Top Promo Bar
    $('li.promo-message a.promoClose').on('click', _handlePromoBarClick);
    $(window).resize(_.debounce(_handleWindowResize, 200));

});
