/*jslint regexp: true, nomen: true, sloppy: false */
/*global window, navigator, document, setTimeout, define, mo */
$(function() {

    'use strict';

    var mo = window.mo || {};
    $.fn.Helper = {};

    /**
     * MO.Helper.offclick
     * Off target element click event trigger handler
     */

    $.fn.offclick = function(callback){
        this.each(function(i, el){
            var $el = $(el);
            //if(!!($el.data("offclick"))) return;
            $el.offTargetTrigger = function(e){
                e.stopPropagation();
                var isOffTarget = !((e.target === el) || !!($(e.target).parents("[class='" + el.className + "']").length));
                if(!isOffTarget) return;
                if($.isFunction(callback)) callback(e);
                $(document).off("click", $el.offTargetTrigger);
                $el.removeData("offclick");
            };
            $(document).on("click", $el.offTargetTrigger);
            $el.data("offclick", true);
        });
        return this;
    };


    /**
     * MO.Helper.onFocusClear
     * Clears form inputs of default value.
     * @param callback Focus callback function
     */

    $.fn.onFocusClear = function(callback){
        this.each(function(i, el){
            var $el = $(el);
            $el.placeholder = $el.attr("placeholder");
            $el.addClass("placeholder");
            if(!!($el.placeholder))    this.defaultValue = $el.placeholder;
            $el.focusin(function(e){
                if(this.value === this.defaultValue) this.value = "";
                $el.removeClass("placeholder");
                if($.isFunction(callback)) callback($el);
            }).focusout(function(e){
                if(!!!(this.value)){
                    this.value = this.defaultValue;
                    $el.addClass("placeholder");
                }
            }).trigger("focusout");
        });
    };


    /**
     * MO.Helper.enhance is jQuery plugin that beautifies form elements.
     * @return {Object} this
     */

    $.fn.enhance = function(options){
        var self = this;
        this.options = {
            classNamePrefix: "mo"
        };
        $.extend(this.options, options);

        // Extend jQuery Filter selector
        $.extend($.expr[":"], {
            "startWith": function(el, i, match, array){
                return (el.textContent || el.innerText || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) === 0;
            }
        });

        this.each(function(i, el){
            var $el = $(el),
                nodeName = el.nodeName.toLowerCase(),
                classNamePrefix = '';

            switch(nodeName){
                case "select":
                    // Generate Markup
                    classNamePrefix = self.options.classNamePrefix + "-select";
                    classNamePrefix = "select";
                    var originalClassName = '';
                    if(self[0].className.indexOf('mobile-only') > -1) {
                        originalClassName = self[0].className;
                    }

                    if($el.hasClass('qty') || $el.hasClass('setqty')) {
                        $el.width = $el.outerWidth();
                    } else {
                        $el.width = ($el.outerWidth() > 150) ? $el.outerWidth() : 150;
                    }

                    $el.tabindex = $el.attr("tabindex") || (i + 1);
                    $el.wrapper = $el.wrap("<div class='" + classNamePrefix + " " + originalClassName + "' tabindex='" + $el.tabindex + "'></div>").parent().addClass($el[0].name);
                    $el.section = $el.parents('section');
                    $el.dropdown = $("<div class='" + classNamePrefix + "-dropdown'><ul></ul></div>").prependTo($el.wrapper);
                    $el.dropdown.isOpened = false;
                    var buildOptions = function(){
                        $el.options = $el.find("option");

                        if($el.options.filter(":selected").length && $el.options.filter(":selected").val() !== '') {
                            //Something is set as selected, select that.
                            $el.options.selected = $el.options.filter(":selected");

                        } else if($el.options.length == 2 && $el.options.eq(0).val() === '' && !$el.options.eq(0).prop('disabled')) {
                            //Nothing is default selected, and we only have 1 option with a value, choose that.
                            $el.options.selected = $el.options.eq(1).prop('selected', true);
                            if($el.attr('id') == 'creditCardList' || $el.attr('id') == 'adsAccountList') {

                                window.setTimeout(function(){
                                    $el.trigger('change');
                                }, 50);
                            }
                        } else {
                            //Nothing is default selected, and we have multiple options, select first label value
                            $el.options.selected = $el.options.eq(0).prop('selected', true);

                        }

                        var list = "";

                        function _disableHandler(e) {
                            e.stopPropagation();
                            /*jshint validthis:true */
                            $(this).prop('disabled', true);
                        }

                        function _enableHandler(e) {
                            e.stopPropagation();
                            /*jshint validthis:true */
                            $(this).prop('disabled', false);
                        }

                        function _hideHandler(e) {
                            e.stopPropagation();
                            /*jshint validthis:true */
                            $(this).addClass('hidden');
                        }

                        function _showHandler(e) {
                            e.stopPropagation();
                            /*jshint validthis:true */
                            $(this).removeClass('hidden');
                        }

                        for(var i = 0; i < $el.options.length; i++){
                            var className = " class='";
                            if($el.options.eq(i).prop("selected")) className += "selected";
                            if($el.options.eq(i).prop("disabled")) className += " disabled";
                            if($el.options.eq(i).hasClass('hidden')) className += " hidden";
                            className += "'";

                            list += "<li" + className + " data-value='" + $el.options[i].value + "'><span>" + $el.options.eq(i).text() + "</span></li>";

                            $el.options.eq(i).on('disable', _disableHandler);

                            $el.options.eq(i).on('enable', _enableHandler);

                            $el.options.eq(i).on('hide', _hideHandler);

                            $el.options.eq(i).on('show', _showHandler);
                        }

                        $el.dropdown.find("ul").html(list);
                        $el.dropdown.list = $el.dropdown.find("li");
                        $el.options.selectedIndex = $el.options.index($el.options.selected);

                    };
                    buildOptions();

                    //If we dont have a selected <option> but we do have a selected <li> set title to the <li>.
                    //When using back button, the <option> gets reselected but the JS doesnt reinit the dropdown title.
                    if($el.dropdown.find('li.selected').length && $el.find("option").filter("[selected]").length === 0) {
                        $el.title = $("<span class='" + classNamePrefix + "-title'>" + $el.dropdown.find('li.selected').text() + "</span>").prependTo($el.wrapper);
                    } else {
                        $el.title = $("<span class='" + classNamePrefix + "-title'>" + $el.options.selected.text() + "</span>").prependTo($el.wrapper);
                    }

                    //This was causing the Payment Term dropdown on the Payment page to not fit
                    //the full size when resizing the window.
                    //$el.wrapper.css("min-width", $el.width + "px");

                    // Multi Select Logic
                    $el.multiple = $el.attr("multiple");
                    if(($el.multiple == "multiple")){
                        $el.size = $el.attr("size");
                        $el.dropdown.list.toggle(function(e){
                            var $li = $(this);
                            $li.addClass("selected");
                            $el.options.filter("[value='" + $li.attr("data-value") + "']").prop("selected", true);
                            $el.trigger("change");
                        }, function(e){
                            var $li = $(this);
                            $li.removeClass("selected");
                            $el.options.filter("[value='" + $li.attr("data-value") + "']").prop("selected", false);
                            $el.trigger("change");
                        });
                        $el.options.filter("[selected]").each(function(i, el){
                            $el.dropdown.list.filter("[data-value='" + $(el).attr("value") + "']").trigger("click");
                        });
                        $el.wrapper.removeClass(classNamePrefix).addClass(classNamePrefix + "-multi-select").addClass(classNamePrefix + "-size-" + $el.size);
                        return;
                    }

                    // Custom Events
                    $el.on({
                        "update": function(e){
                            $el.wrapper.trigger("update");
                        },
                        "change": function(e){

                            $el.options.selected = ($el.options.filter("[selected]").length) ? $el.options.filter("[selected]") : $el.options.eq(0);
                            $el.options.selectedIndex = $el.options.index($el.find('option:selected'));

                            $el.options.selected.prop("selected", false).attr("selected", false);

                            $el.options.selected = $el.options.eq($el.options.selectedIndex).prop("selected", true);
                            $el.wrapper.trigger("update");
                            $el.options.eq($el.options.selectedIndex).attr('selected', 'selected')
                        },
                        "refresh": function(e){
                            $el.dropdown.list.remove();
                            buildOptions();
                            $el.wrapper.trigger("update");
                        },
                        "reset": function(e){
                            $el.options.selected = ($el.options.filter("[selected]").length) ? $el.options.filter("[selected]") : $el.options.eq(0);
                            $el.options.selectedIndex = $el.options.index($el.options.selected);
                            $el.val(!(this.defaultValue) ? this.defaultValue : "").trigger("change");
                        }
                    });

                    $el.wrapper.on({
                        "open": function(e){
                            $el.wrapper.addClass(classNamePrefix + "-active");
                            $el.section.addClass('showmenu');
                            $el.dropdown.isOpened = true;
                        },
                        "close": function(e){
                            if($el.dropdown.isOpened) {
                                $el.wrapper.removeClass(classNamePrefix + "-active");
                                window.setTimeout(function() { // setTimeout required to avoid some ugly visual artifacts. Meh.
                                    $el.section.removeClass('showmenu');
                                },20);
                                $el.dropdown.isOpened = false;
                            }
                        },
                        "focus": function(e){
                            $el.wrapper.addClass(classNamePrefix + "-focus");
                        },
                        "blur": function(e){
                            $el.wrapper.removeClass(classNamePrefix + "-focus");
                            //$el.wrapper.trigger("close");
                        },
                        "update": function(e){
                            var lastWidth = $el.wrapper.width();

                            $el.dropdown.list.each(function(i){ $(this).removeClass("selected"); });
                            $el.title.text($el.dropdown.list.eq($el.options.selectedIndex).text());

                            $el.dropdown.list.eq($el.options.selectedIndex).addClass("selected");

                            if( (lastWidth > $el.wrapper.width()) && !($el.parents().hasClass("small-select")) )  {
                                if(lastWidth < 150) {
                                    lastWidth = 150;
                                }

                                $el.wrapper.css("min-width", lastWidth + "px");
                            }

                        },
                        "click": function(e) {

                            var nodeName = e.target.nodeName.toLowerCase();
                            if(nodeName == "div") {
                                if(!$el.wrapper.hasClass("select-active")) {
                                    $el.title.trigger('click');
                                } else {
                                    $el.wrapper.trigger('close');
                                }
                            } else {
                                return;
                            }
                        }
                    });

                    // Interaction Logic
                    // Show/Hide Dropdown Click Event Handler
                    $el.title.on("click", function(e){
                        //e.stopPropagation();
                        if($el.wrapper.hasClass("disabled")) return;
                        if(!$el.dropdown.isOpened) {
                            $el.wrapper.trigger("open").offclick(function(){
                                $el.wrapper.trigger("close");
                                $el.dropdown.scrollTop($el.dropdown.list.eq($el.options.selectedIndex).position().top);
                            });
                        } else {
                            $el.wrapper.trigger("close");
                            $el.dropdown.scrollTop($el.dropdown.list.eq($el.options.selectedIndex).position().top);
                        }
                    });

                    // List Options Select Event Handler
                    $el.dropdown.on("mousedown", function(e){
                        var nodeName = e.target.nodeName.toLowerCase(),
                            $li;

                        if(nodeName == "span") {

                            $li = $(e.target).parent();

                        } else if(nodeName == "li") {

                            $li = $(e.target);

                        } else {

                            return;
                        }

                        //Check if Disabled Option
                        if($li.hasClass('disabled') || $li.hasClass('hidden')) return;

                        var value = $li.attr("data-value");
                        $el.wrapper.trigger("close");
                        $el.highlightIndex = $el.options.selectedIndex = $el.dropdown.list.index($li);
                        if($el[0].value !== value) $el.val(value).trigger("change");

                    });

                    // Key listener Event
                    var searchIndex = 0,
                        currentSearchKey;
                    $el.wrapper.on("keydown", function(e){
                        var code = parseInt(e.keyCode),
                            character = String.fromCharCode(code),
                            alphanumeric = /^[a-zA-Z0-9_]*$/;
                        if(code === 9) return true; // Tab Key
                        e.preventDefault();
                        // Up and Down Selection
                        if(!($el.highlightIndex)) $el.highlightIndex = 0;
                        switch(code){
                            case 38:
                                $el.highlightIndex = ( $el.highlightIndex === 0 ?  $el.options.length - 1 : $el.highlightIndex - 1);
                                break;
                            case 40:
                                $el.highlightIndex = ($el.highlightIndex === ($el.options.length - 1) ?  0 : $el.highlightIndex + 1);
                            break;
                        }
                        if(code === 38 || code === 40){
                            $el.title.trigger("open");
                            $el.dropdown.list.filter("[class='selected']").removeClass("selected");
                            $el.dropdown.scrollTop($el.dropdown.list.eq($el.highlightIndex)[0].offsetTop);

                            $el.options.selectedIndex = $el.highlightIndex;
                            $el.val($el.options.eq($el.highlightIndex).val()).trigger("change");
                            return;
                        }
                        if($el.dropdown.isOpened && code == 13){
                            $el.options.selectedIndex = $el.highlightIndex;
                            $el.val($el.options.eq($el.highlightIndex).val()).trigger("change");
                            $el.wrapper.trigger("close");
                        }
                        if(!alphanumeric.test(character)) return;
                        var $results = $el.options.filter(":startWith(" + character  + ")");
                        if(character !== currentSearchKey){
                            currentSearchKey = character;
                            searchIndex = 0;
                        } else if(character === currentSearchKey) {
                            searchIndex = (searchIndex == ($results.length - 1) ? 0 : searchIndex + 1);
                        }
                        if(!$results.eq(searchIndex).length) return;
                        $el.highlightIndex = $el.options.selectedIndex = $el.options.index($results.eq(searchIndex));
                        $el.val($results.eq(searchIndex).val()).trigger("change");
                    });
                break;


                case "input":
                    var nodeType = $el.attr("type");
                    switch(nodeType){
                        case "checkbox":
                            // Generate Markup
                            classNamePrefix = self.options.classNamePrefix + "-checkbox";
                            classNamePrefix = "input checkbox";
                            $el.checkbox = $el.css('visibility','hidden');
                            $el.wrapper = $el.checkbox.wrap("<span class='" + classNamePrefix + "'></span>").parent().addClass($el.checkbox[0].name);
                            if(typeof $el.attr('class') != "undefined"){
                                var classes=$el.attr('class').split(/\s/);

                                for(i =0;i<classes.length;i++){
                                    $el.checkbox.parent().addClass('wrapper-'+classes[i]);
                                }
                            }
                            $el.on({
                                "change": function(e){
                                    var checkedPropStatus = $el.prop('checked') ? false : true;
                                    $el.prop('checked', checkedPropStatus);
                                    $el.wrapper.trigger('update');
                                }
                            });

                            $el.wrapper.on({
                                "update": function(e){
                                    var checkedStateMethod = $el.prop('checked') ? 'addClass' : 'removeClass';
                                    $el.wrapper[checkedStateMethod]('checked');
                                },
                                "click": function(e){
                                    if($el.wrapper.hasClass('disabled') || $el.wrapper.hasClass('wrapper-disabled')) {
                                    	return;
                                    }
                                    $el.trigger("change");
                                }
                            }).trigger("update");
                        break;

                        case "radio":
                            classNamePrefix = self.options.classNamePrefix + "-radio";
                            classNamePrefix = "input radio";
                            $el.radio = $el.hide();
                            $el.name = $el.radio.attr("name");
                            $el.wrapper = $el.radio.wrap("<span class='" + classNamePrefix + "'></span>").parent().addClass($el.radio[0].name);
                            $el.wrapper.attr("rel", $el.name);

                            $el.on({
                                "change": function(e){
                                    $el.prop("checked", true);
                                    $el.wrapper.trigger("update");
                                }
                            });

                            $el.wrapper.on({
                                "update": function(e){
                                    var checkedStateMethod = $el.prop('checked') ? 'addClass' : 'removeClass';
                                    $el.wrapper[checkedStateMethod]('checked');
                                },
                                "click": function(e){
                                    if($el.wrapper.hasClass("disabled") | $el.wrapper.hasClass("checked")) return;
                                    $("[rel=" + $el.name + "]").filter(".checked").removeClass("checked");
                                    $el.trigger("change");
                                }
                            }).trigger("update");
                        break;
                    }
                break;
            }
            // Custom Event
            $el.on({
                "disable": function(e){
                    $el.prop("disabled", true);
                    $el.wrapper.addClass("disabled");
                },
                "enable": function(e){
                    $el.prop("disabled", false);
                    $el.wrapper.removeClass("disabled");
                }
            });

            if($el.prop("disabled")) $el.trigger("disable");
        });
        return this;
    };

    var cardURLSArray = $('.card-url'),
        heroArray = $('.hero-container'),
        cardLoadedIndex = 0,
        docViewTop,
        docViewBottom,
        previousCardTop;
    
    var wp = function(direction) {
        var $section,
            dest;

        if($(this).parents('section.hero-slide').length > 0) {
            $section = $(this).parents('section.hero-slide');
        } else {
            $section = $(this);
        }

        dest = $section.attr('id');

        $('.sticky-nav').find('a.stickylink').removeClass('active');
        $('.sticky-nav').find('a.stickylink').filter('a[href="#' + dest + '"]').addClass('active');
    };

    mo.cardLoader = {
        init: function(){
            //initialize store front card loading
            if(cardURLSArray.length > 0){
                this.loadScroller();
            }
        },

        //check which cards should be loaded on page load
        loadCard: function(card, last){
            var url;
            if(card){
                url = $(card).attr('data-url');
            } else {
                url = $(cardURLSArray[cardLoadedIndex]).attr('data-url')
            }
            //once initial cards are loaded, add scrolling loading and load next card in line
            $.ajax({
                url: url,
                success:function(data){
                    var cardLoaded = card|| cardURLSArray[cardLoadedIndex],
                        parallax = $(cardLoaded).attr('data-url').indexOf('CARD_SVC_PDPScrollingContainer-Template'),
                        cardSizeHeight = $('.card-size').height(),
                        currentCard = $(cardLoaded)[0],
                        windowWidth = $(window).width(),
                        isCarousel = $(cardLoaded).attr('data-url').indexOf('carousel');

                    $(cardLoaded).removeAttr('id');
                    $(cardLoaded).html(data);

                    cardLoadedIndex++;
                    
                    $(cardLoaded).find('> section').waypoint({
                        handler: wp,
                        offset: $('.sticky-nav').outerHeight()
                    });
                    
                    $.waypoints('refresh');

                    if($(currentCard).find('.card-size')){
                        if(windowWidth <= 500){
                            $(currentCard).find('.card-size').css('height', 'auto');
                        } else {
                            $(currentCard).find('.card-size').css('height', cardSizeHeight);
                        }
                    }

                    if(parallax > 0){
                        mo.pdpScroll.init();
                        if(!mo.pdpScroll.checkMobile()){
                            skrollr.init().refresh();
                        }
                    }

                    if(isCarousel > 0) {
                        var autoPlaySlides,
                            _autoPlayInterval;

                        _autoPlayInterval = $('footer').data('autoplay-interval');
                        autoPlaySlides = ( _autoPlayInterval ? _autoPlayInterval : null );

                        $(currentCard).find('.carousel').carousel({infinite: true, vertical: false, autoplay: autoPlaySlides});
                    }

                    //resize sticky nav if present
                    if(mo.resizeStickyNav){
                        mo.resizeStickyNav()
                    }

                    if(last === true){
                        $.event.trigger('scrollToCard');
                        window.mo.loader.hide();
                    }
                },
                error: function(){
                    $(cardLoaded).html('Error loading card');
                    cardLoadedIndex++;
                    $.waypoints('refresh');
                    //resize sticky nav if present
                    if(mo.resizeStickyNav){
                        mo.resizeStickyNav()
                    }
                    window.mo.loader.hide();
                }
            });
        },

        loadScroller: function(){
            $(window).on('scroll', function(){
                //unbind scroll event after all cards are loaded
                if((cardLoadedIndex) >= cardURLSArray.length ){
                    return;
                }

                //if card is in view, load next card that is not visible yet. Repeat until all are loaded.
                docViewTop = $(window).scrollTop();
                docViewBottom = docViewTop + $(window).height();
                if(cardLoadedIndex > 0){
                    previousCardTop = $(cardURLSArray[cardLoadedIndex-1]).offset().top;
                } else {
                    var lastElem = heroArray[heroArray.length - 1];
                    previousCardTop = $(lastElem).offset().top;
                }

                if ((previousCardTop < docViewBottom) && (cardLoadedIndex < cardURLSArray.length && !cardURLSArray[cardLoadedIndex].requestMade)){
                    //set to make sure request is only made once for each card
                    cardURLSArray[cardLoadedIndex].requestMade = true;
                    mo.cardLoader.loadCard();
                }
            });
        }
    };

    mo.cardLoader.init();

    /**
     * MO.Helper.scrollNav
     * Scrolls from a[data-arrival] to *[data-dest]
     * @param options Object currently just checks to see if waypoints are set
     */

    $.fn.scrollNav = function(options){
        var self = this;
        var $stickynav = this,
            $sections = $('section[id]'),
            $body = $('html, body'),
            $preloadSections;

        if($('.card-url').length>0){
            $preloadSections = $('div.card-url[id]');
        }

        $stickynav.items = $stickynav.find('a.stickylink');

        if($('#container').hasClass('home-page')) {
            $('.sticky-wrapper').css('height','');
            $('.pagination a:first').addClass('active');
        } else {
            var stickyHeight = $('.sticky-nav').height();
            $('.sticky-wrapper').height(stickyHeight);
        }

        if($stickynav.items.length < 1 && $stickynav.hasClass('sticky-nav')) {
            $(this).hide();
            $(this).parents('.sticky-wrapper').hide();
        } else if(typeof options != 'undefined' && typeof options.waypoint != 'undefined') {
            if(typeof options.optionlist == 'undefined'){
                $stickynav.waypoint(options.waypoint);
            } else {
                $stickynav.waypoint(options.waypoint, options.optionlist);
            }
        }

        if($stickynav.length){
            $stickynav.items.on('click', function(e){
                e.preventDefault();
                var $section,
                    dest;
                //reset the section id's if preloaders are there
                if($preloadSections && $preloadSections.length>0){
                    $sections = $('section[id]');
                }

                if($(this).parents('section.hero-slide').length > 0) {
                    $section = $(this).parents('section.hero-slide');
                } else {
                    $section = $(this);
                }

                dest = $section.attr('href').replace('#','');

                var scrollToCard = function(){
                    //$( document ).ready(function(){
                        setTimeout(function(){
                            //reset the section id's if preloaders are there
                            if($preloadSections && $preloadSections.length>0){
                                $sections = $('section[id]');
                            }

                            var h = $('.sticky-nav').outerHeight(),
                                tgt;

                            if($('#container').hasClass('home-page')) {
                                if($('.order-status-section').length > 0) {
                                    orderStatusHeight = $('.order-status-section').height();
                                } else {
                                    orderStatusHeight = 0;
                                }
                                if($sections.filter('[id="' + dest + '"]').length>0){
                                    tgt = $sections.filter('[id="' + dest + '"]').offset().top - $('nav').height() + orderStatusHeight;
                                }else {
                                    tgt = $preloadSections.filter('[id="' + dest + '"]').offset().top - $('nav').height() + orderStatusHeight;
                                }

                            } else if($('.sticky-nav').is(':visible')) {
                                if($sections.filter('[id="' + dest + '"]').length>0){
                                    tgt = $sections.filter('[id="' + dest + '"]').offset().top - h;
                                }else {
                                    tgt = $preloadSections.filter('[id="' + dest + '"]').offset().top - h;
                                }

                                //subtract the sticky nav height again if it is not set to postion fixed yet
                                if(!$('.sticky-nav').hasClass('stuck')){
                                    tgt = tgt;
                                }

                            } else {
                                if($sections.filter('[id="' + dest + '"]').length>0){
                                    tgt = $sections.filter('[id="' + dest + '"]').offset().top;
                                }else {
                                    tgt = $preloadSections.filter('[id="' + dest + '"]').offset().top;
                                }
                            }
                            if($('html').hasClass('lt-ie9')) {
                                var curr = $(window).scrollTop();
                                if(curr > tgt) {
                                    tgt = tgt - 1;
                                } else {
                                    tgt = tgt;
                                }
                                window.scrollTo(0, tgt);
                            } else {
                                $body.animate({
                                    scrollTop: tgt
                                }, 350, 'swing', function() {
                                    $sections.waypoint({
                                        handler: wp,
                                        offset: h
                                    });
                                });
                            }
                            if(window.history && !$('html').hasClass('lt-ie9')) {
                                window.history.pushState({}, '', '#' + dest);
                            }
                        }, 500);

                    //});

                };

                $(document).on("scrollToCard", scrollToCard);
                if($sections.filter('[id="' + dest + '"]').length > 0){
                    scrollToCard();
                } else {
                    window.mo.loader.show();
                    $('.modal.loader').show();
                    var cardsArray = $('.card-url');
                    for(i=0; i < cardsArray.length; i++){
                        var currentId = cardsArray[i].id;
                        if(dest === currentId){
                            mo.cardLoader.loadCard(cardsArray[i], true);
                            return;
                        } else {
                            mo.cardLoader.loadCard(cardsArray[i]);
                        }
                    }
                }
            });
            $sections.waypoint({
                handler: wp,
                offset: $('.sticky-nav').outerHeight()
            });
        }
    };

    //Open video modals

    $('.open-video-modal').width($('.open-video-modal').find('img').width());
    $('.open-video-modal').on('click', function(e){
        e.preventDefault();

        var data = $(e.currentTarget).data("modalcontent");

        templates.get("video-modal").done(function(handler){
            modal.render(handler, data);

            var innerWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
            var innerHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

            $('.overlay').css({opacity: 1});

            if(innerWidth*(9/16) > innerHeight) {
                $('#video-modal .container').width((innerHeight-100)*(16/9) + 'px').css({margin: '0 auto'});
            }

            window.onresize = function() {
                $('#video-modal .container').width((innerHeight-100)*(16/9) + 'px').css({margin: '0 auto'});
            };

        });
    });

    //Adjust gallery button
    if(Modernizr.touch) {

        $('.open-gallery-modal .gallery-btn').show().css({display: 'inline-block', position:'relative', left: 0, top: 0, margin: '0 auto'});

    } else {

        $('.open-gallery-modal').on("mouseover", function(e){
            $(this).find('.gallery-btn').show();
        });

        $('.open-gallery-modal').on("mouseout", function(e){
            $(this).find('.gallery-btn').hide();
        });
    }


    var threeSixtyInstance = new Viewer({selector: '.cards-rotator'});

    //Open gallery modals
    $('.open-gallery-modal').on('click', function(e){

        e.preventDefault();

        var data = $(e.currentTarget).data("modalcontent");

        templates.get("gallery-modal").done(function(handler){
            modal.render(handler, data);

            threeSixtyInstance.init();

            $('#gallery-modal .image-gallery').find('li:first').show();

            //$('#gallery-modal .image-gallery').find('li:first img').height(innerHeight - 150);

            if(Modernizr.touch) {
                if(!$('.mobile-only').is(':hidden')) {
                //    $('#gallery-modal .image-gallery').find('li:first img').height(innerHeight - 50);
                }
            }

            $('#gallery-modal .image-gallery').find('li:first img').one('load', function() {
                var hOffset = 150;
                if(Modernizr.touch) {
                    if(!$('.mobile-only').is(':hidden')) {
                        hOffset = 50;
                    }
                }

                if($('#gallery-modal .image-gallery').find('li:first img').height() > innerHeight - hOffset) {
                    $('#gallery-modal .image-gallery').find('li:first img').height(innerHeight - hOffset);
                }

                $('#gallery-modal .image-gallery').height($('#gallery-modal .image-gallery').find('li:first img').height());
            });

            $('#gallery-modal .container').on('click', function(e){
                console.log('close Modal');
                modal.close();
            });

            //Resize functionality for .image-gallery container
            function resizeContainer($galleryContainer) {
                var $viewerContainer = $('.cards-rotator'),
                    $galleryWrapper = $('#gallery-modal .image-gallery'),
                    adaptiveHeight = innerHeight - 150;

                if ( $viewerContainer.parent().hasClass('active') ) {

                    if($viewerContainer.find('li.active img').height() > adaptiveHeight) {
                        $viewerContainer.find('li img').height(adaptiveHeight);
                    }

                    $galleryWrapper.height($viewerContainer.find('li img').height());
                    $viewerContainer.height($viewerContainer.find('li img').height());

                } else {

                    if($galleryWrapper.find('li.active img').height() > innerHeight - 150) {
                        $galleryWrapper.find('li.active img').height(innerHeight - 150);
                    }

                    $galleryWrapper.height($galleryWrapper.find('li.active').height());
                }
            }

            $('#gallery-modal .control').on('click', function(e){
                e.stopPropagation();

                var $galleryContainer = $('#gallery-modal .image-gallery'),
                    $pagination = $('#gallery-modal .pagination');
                console.log('control click');

                if($(this).hasClass('left')) {
                    //Left Control
                    console.log('control left');
                    $galleryContainer.prepend($galleryContainer.children('li:last').addClass('active').hide())
                        .find('li:first')
                        .next().removeClass('active')
                        .prev()
                        .fadeIn(300, function() {
                            $(this).next().hide().removeClass('active');

                            var innerHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

                            resizeContainer();
                        });

                    if($pagination.find('span.active').prev().length > 0) {
                        $pagination.find('span.active').removeClass('active').prev().addClass('active');
                    } else {
                        $pagination.find('span.active').removeClass('active').parent().find('span:last').addClass('active');
                    }
                } else {
                    //Right Control
                    console.log('control right');
                    $galleryContainer.append($galleryContainer.children('li:first').removeClass('active'))
                        .find('li:first')
                        .addClass('active')
                        .fadeIn(300, function() {
                            $galleryContainer.find('li:last').hide();

                            var innerHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

                            resizeContainer();

                        });



                    if($pagination.find('span.active').next().length > 0) {
                        $pagination.find('span.active').removeClass('active').next().addClass('active');
                    } else {
                        $pagination.find('span.active').removeClass('active').parent().find('span:first').addClass('active');
                    }
                }

            });

            $('#gallery-modal .image-gallery').on('click', function(e){
                e.stopPropagation();
            });

            $('#gallery-modal .pagination span').on('click', function(e){
                e.stopPropagation();
                var $galleryContainer,
                    $pagination;
                console.log('thumb click: ' + $(this).index());
                if(!$(this).hasClass('active')) {
                    $galleryContainer = $('#gallery-modal .image-gallery');
                    $pagination = $('#gallery-modal .pagination');

                    var incrementIndex = (($(this).index() - $(this).parent().find('.active').index() > 0)) ? $(this).index() - $(this).parent().find('.active').index() : ($(this).index() - $(this).parent().find('.active').index()) + $(this).parent().find('span').length;

                    for(var i = 0; i < incrementIndex; i++) {
                        $galleryContainer.append($galleryContainer.find('li:first').removeClass('active'));

                        if($pagination.find('span.active').next().length > 0) {
                            $pagination.find('span.active').removeClass('active').next().addClass('active');
                        } else {
                            $pagination.find('span.active').removeClass('active').parent().find('span:first').addClass('active');
                        }

                    }

                    $galleryContainer.find('li:first')
                        .addClass('active')
                        .fadeIn(300, function() {
                            // $galleryContainer.find('li').not('.active').hide();
                            $galleryContainer.children('li').not('.active').hide();

                            resizeContainer();
                        });

                }
            });

        });
    });


    //Gallery Hero Card
    //Init

    var innerWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
    var innerHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
    var thumbsOffsetOrigin = (innerWidth - parseInt($('.gallery-slide .in-grid').css('max-width')))/2;
    thumbsOffsetOrigin = (thumbsOffsetOrigin < 0) ? 0 : thumbsOffsetOrigin;


    if(Modernizr.touch) {
        $('.gallery-slide .control').hide();
        $('.gallery-slide h2').css({fontSize: '2em'});

    } else {
        window.onresize = function(){
            innerWidth = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
            innerHeight = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;
            var thumbsOffsetOrigin = (innerWidth - parseInt($('.gallery-slide .in-grid').css('max-width')))/2;
            thumbsOffsetOrigin = (thumbsOffsetOrigin < 0) ? 0 : thumbsOffsetOrigin;

            $('.gallery-slide .image-gallery').find('li').height(innerWidth*(0.6));
        };
    }

    //console.log('thumboffsetorigin: ' + thumbsOffsetOrigin);

    $('.gallery-slide .image-gallery').find('li:first').addClass('active').fadeIn();
    $('.gallery-slide .thumbs ul').width($('.gallery-slide .thumbs ul li').length * 240).css({marginLeft: thumbsOffsetOrigin });
    $('.gallery-slide .thumbs ul').find('li:first').addClass('active');

    $('.gallery-slide .image-gallery .currentIndex').text(1);
    $('.gallery-slide .image-gallery .totalImages').text($('.gallery-slide .image-gallery li').length);

    $('.gallery-slide .image-gallery').find('li').height(innerWidth*(0.6));

    if($.fn.swipe){
        console.log('Swipe defined');
    $('.gallery-slide').swipe({

        allowPageScroll: "vertical",
        swipe:function(event, direction, distance, duration, fingerCount) {

            if(direction == 'left') {
                $('.gallery-slide .right').click();
            } else if(direction == 'right') {
                $('.gallery-slide .left').click();
            }

        }
    });
    }

    $('.gallery-slide .control').on('click', function(e){
        e.stopPropagation();
        var paginationOffset,
            $galleryContainer,
            $pagination;

        thumbsOffsetOrigin = (innerWidth - parseInt($('.gallery-slide .in-grid').css('max-width')))/2;
        thumbsOffsetOrigin = (thumbsOffsetOrigin < 0) ? 0 : thumbsOffsetOrigin;

        $galleryContainer = $('.gallery-slide .image-gallery');
        $pagination = $('.gallery-slide .thumbs');

        console.log('control click');

        if($(this).hasClass('left')) {
            //Left Control
            console.log('control left');
            $galleryContainer.prepend($galleryContainer.find('li:last').addClass('active').hide())
                .find('li:first')
                .next().removeClass('active')
                .prev()
                .fadeIn().next().hide().removeClass('active');

                if($pagination.find('li.active').prev().length > 0) {
                    console.log($pagination.find('li.active').index());
                    $pagination.find('li.active').removeClass('active').prev().addClass('active');
                } else {
                    $pagination.find('li.active').removeClass('active').parent().find('li:last').addClass('active');
                }

                $('.gallery-slide .image-gallery .currentIndex').text($pagination.find('li.active').index() + 1);

                paginationOffset = (-240 * $pagination.find('li.active').index()) + thumbsOffsetOrigin;

                if((innerWidth/2) <= $pagination.find('li.active').offset().left) {
                    $pagination.find('ul').animate({marginLeft: (-240 * $pagination.find('li.active').index()) + (innerWidth/2 - 120) }, 300);
                } else {
                    if($pagination.find('ul').offset().left + 240 < thumbsOffsetOrigin) {
                        $pagination.find('ul').animate({marginLeft: (-240 * $pagination.find('li.active').index()) + (innerWidth/2 - 120) }, 300);
                    } else {
                        $pagination.find('ul').animate({marginLeft: thumbsOffsetOrigin}, 300);
                    }
                }

        } else {
            //Right Control
            console.log('control right');
            $galleryContainer.append($galleryContainer.find('li:first').removeClass('active').hide())
                .find('li:first')
                .addClass('active')
                .fadeIn(300);

                if($pagination.find('li.active').next().length > 0) {
                    $pagination.find('li.active').removeClass('active').next().addClass('active');
                } else {
                    $pagination.find('li.active').removeClass('active').parent().find('li:first').addClass('active');
                }


                $('.gallery-slide .image-gallery .currentIndex').text($pagination.find('li.active').index() + 1);

                paginationOffset = (-240 * $pagination.find('li.active').index()) + thumbsOffsetOrigin;
                console.log(innerWidth);
                if((innerWidth/2) <= $pagination.find('li.active').offset().left) {
                    $pagination.find('ul').animate({marginLeft: (-240 * $pagination.find('li.active').index()) + (innerWidth/2 - 120) }, 300);
                } else {
                    if($pagination.find('ul').offset().left <= thumbsOffsetOrigin) {
                        $pagination.find('ul').animate({marginLeft: thumbsOffsetOrigin}, 300);
                    } else {
                        $pagination.find('ul').animate({marginLeft: (-240 * $pagination.find('li.active').index()) + (innerWidth/2 - 120) }, 300);
                    }
                }
        }
    });

    $('.gallery-slide .thumbs ul li').on('click', function(e){
        var $galleryContainer,
            $pagination;

        thumbsOffsetOrigin = (innerWidth - parseInt($('.gallery-slide .in-grid').css('max-width')))/2;
        thumbsOffsetOrigin = (thumbsOffsetOrigin < 0) ? 0 : thumbsOffsetOrigin;

        if(!$(this).hasClass('active')) {
            $galleryContainer = $('.gallery-slide .image-gallery');
            $pagination = $('.gallery-slide .thumbs');

            var incrementIndex = (($(this).index() - $(this).parent().find('.active').index() > 0)) ? $(this).index() - $(this).parent().find('.active').index() : ($(this).index() - $(this).parent().find('.active').index()) + $(this).parent().find('li').length;

            for(var i = 0; i < incrementIndex; i++) {
                $galleryContainer.append($galleryContainer.find('li:first').removeClass('active').hide());

                if($pagination.find('li.active').next().length > 0) {
                    $pagination.find('li.active').removeClass('active').next().addClass('active');
                } else {
                    $pagination.find('li.active').removeClass('active').parent().find('li:first').addClass('active');
                }

            }

            $('.gallery-slide .image-gallery .currentIndex').text($pagination.find('li.active').index() + 1);

            $galleryContainer.find('li:first')
                .addClass('active')
                .fadeIn(300, function() {
                    $galleryContainer.find('li').not('.active').hide();
                });


            var paginationOffset = (-240 * $pagination.find('li.active').index()) + thumbsOffsetOrigin;
            console.log(innerWidth);
            if((innerWidth/2) <= $pagination.find('li.active').offset().left) {
                $pagination.find('ul').animate({marginLeft: (-240 * $pagination.find('li.active').index()) + (innerWidth/2 - 120) }, 300);
            } else {
                if($pagination.find('ul').offset().left + 240 < thumbsOffsetOrigin) {
                    $pagination.find('ul').animate({marginLeft: (-240 * $pagination.find('li.active').index()) + (innerWidth/2 - 120) }, 300);
                } else {
                    $pagination.find('ul').animate({marginLeft: thumbsOffsetOrigin}, 300);
                }
            }
        }
    });

    // initialize upgrade modal on confirmation.isml
    if ($('div.upgrade-modal').length) {
        templates.get("upgradedmodal").done(function(handler) {
            modal.render(handler);
        });
    }
    $('.modal.upgradedOrder .button.agree').on('click', function(e){
        e.preventDefault();
        modal.close();
    });

    $('.open-phone-design-modal').on('click', function(e){

        if($(window).width() > 499) {

            e.preventDefault();
            var data = $(e.currentTarget).data("modalcontent");
            templates.get("phone-design-modal").done(function(handler) {
                modal.render(handler, data);
            });

        }
    });

    // Notification hider
    $('.closeNotification').on('click', function () {

        $('.notificationWrap').hide(200);

    });

    // Select Menu Property Watch
    mo.watchInterval = 500;
    mo.watchProperty = function (obj, name, handler) {
        if ('watch' in obj){
            obj.watch(name, handler);
        } else if ('onpropertychange' in obj) {
            name= name.toLowerCase();

            obj.onpropertychange= function() {
                if (window.event.propertyName.toLowerCase()===name)
                handler.call(obj);
            };
        } else {
            var o= obj[name];
            setInterval(function() {

                var n= obj[name];
                if (o!==n) {
                    o= n;
                    handler.call(obj);
                }

            }, mo.watchInterval);
        }
    };

    mo.watchMenuChanges = function () {
        $('select').each(function() {
            var _this = this;
            mo.watchProperty($(this)[0], 'value', function () { $(_this).trigger('change'); });
        });
    };
    return mo;
});

