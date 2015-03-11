$( function(){

	var minicart = {

		// TODO: Make these configurable in business Manager
		showTimeInSeconds : 4,
		fadeInTimeInSeconds : .5,
		fadeOutTimeInSeconds : .5,
		widthToDisableMiniCartInPixels : 960,

		timer : null, // Timer instance for Automatic Closing of the MiniCart.


		/*
		 * Do initial setup, including event bindings for the MiniCart and add-to-cart/buy-now buttons on any page.
		 */
		init: function(){

			//console.log("[mini-cart.js] init called.");

			if(!window.disableMiniCart)
			{

				minicart.updateHtmlContent();

				// Bind click event to the add-to-cart/buy-now buttons on the page
				$('body').on({click: minicart.addToCartEventHandler}, "a.add-to-cart, a.buy-now.right");
			}

		},


		/*
		 * Bind events necessary for MiniCart functioning
		 */
		updateHtmlContent: function(contents){

			//console.log("[mini-cart.js] updateHtmlContent called.");

			// Replace the MiniCart's current contents with the new contents.
			if ( (contents != null) && (typeof contents != 'undefined') ){
				$('.cart-li').html(contents);
			}

			// Bind event handlers to the cartAnchor used to display the mini-cart.
			$(".minicarttotal").hover( minicart.cartAnchorHoverEventHandler );
			$('.cart-li').mouseenter( minicart.cartAnchorMouseEnterEventHandler );
			$('.cart-li').mouseleave( minicart.cartAnchorMouseLeaveEventHandler );

			// Bind event handler to the remove link for each product in the mini-cart.
			$(".minicartcontent a.remove").on( "click", minicart.removeItemEventHandler );

		},


		/*
		 * UI Event Handler for clicking on the cartAnchor
		 */
		cartAnchorHoverEventHandler : function(e){

			//console.log("[mini-cart.js] cartAnchorHoverEventHandler handler called.");

			// Don't display the MiniCart if we detect a mobile or tablet viewport (using configurable max width)
			if(document.body.clientWidth < minicart.widthToDisableMiniCartInPixels){
				return;
			}

			// Show the MiniCart if not already visible.
			if ( !minicart.isVisible()){
				 minicart.show();
			}

		},


		/*
		 * UI Event Handler for the Mouse Entering on the cartAnchor.
		 *
		 * Holds the MiniCart open indefiniatly by stopping the automatic closing timer.
		 */
		cartAnchorMouseEnterEventHandler : function(e) {

			//console.log("[mini-cart.js] cartAnchorMouseEnterEventHandler called.");

			minicart.stopAutoCloseTimer();
		},


		/*
		 * UI Event Handler for the Mouse Leaving on the cartAnchor
		 *
		 * Restarts the automatic closing logic for the MiniCart.
		 */
		cartAnchorMouseLeaveEventHandler : function(e) {

			//console.log("[mini-cart.js] lineItemMouseLeaveEventHandler called.");

			minicart.hide();
		},


		/*
		 * UI Event Handler for AddToCart button Clicks.
		 *
		 * Executes and AJAX AddToCart, unless it's a mobile/tablet.
		 */
		addToCartEventHandler : function(e){
			//pcj modal.close();

			//console.log("[mini-cart.js] addToCartEventHandler() called.");
			if($(this).attr('target') == '_blank')
				return;

			e.preventDefault();

			var href = $(this).attr("href");
			minicart.addItemToCart(href, $(this));

			// Slide the body to the top slowly
			$("html, body").animate({
				scrollTop: 0
			}, 350);
		},


		/*
		 * UI Event Handler for Remove link Clicks for items in the MiniCart.
		 *
		 * Executes and AJAX removal.
		 */
		removeItemEventHandler : function(e){

			//console.log("[mini-cart.js] removeItemEventHandler handler called.");

			e.preventDefault();

			var id = $(this).attr("id");

			minicart.removeCartItem(id);

		},


		/*
		 * Starts (or restarts) the automatic closing logic for the MiniCart by
		 * 	1) Clearing any timeouts and nulling out the minicart.time instance.
		 *  2) Restarting the timer using a configurable amount of time.
		 */
		startAutoCloseTimer: function(){

			minicart.stopAutoCloseTimer();

			// after a time out automatically close it
			minicart.timer = setTimeout( function(){

				minicart.hide();

			}, (minicart.showTimeInSeconds * 1000) );

		},


		/*
		 * Stops the automatic closing logic's timer by clearing the timeout and nulling out the minicart.time instance.
		 */
		stopAutoCloseTimer: function(){

			clearTimeout(minicart.timer);
			minicart.timer = null;

		},


		/*
		 * Returns true if the Timer is currently going.
		 */
		isTimerRunning: function(){

			if ( minicart.timer != null ){
				return true;
			} else {
				return false;
			}
		},


		/*
		 * Returns true/false if the MiniCart is visible.
		 */
		isVisible: function() {

			return $('.minicartcontent').css('display') == 'none' ? false : true;

		},


		/*
		 * Resets the MiniCart by unbinding event handlers.
		 *
		 * TODO: Not used internally. Determine if this is actually used externally and eliminate if possible.
		 */
		reset: function() {

			//console.log("[mini-cart.js] reset called.");

			$(".minicarttotal").unbind("hover");
			$('.minicartcontent').unbind("mouseenter").unbind("mouseleave");

		},


		/*
		 * Shows the MiniCart.
		 */
		show: function() {

			//console.log("[mini-cart.js] show called.");

			// Don't display the MiniCart if we detect a mobile or tablet viewport (using configurable max width)
			if(document.body.clientWidth < minicart.widthToDisableMiniCartInPixels){
				return;
			}

			// Fade in the content div of the MiniCart.
			$('.minicartcontent').fadeIn( (minicart.fadeInTimeInSeconds * 1000) );

			$('.cart-li').addClass("active");

			minicart.startAutoCloseTimer();
		},


		/*
		 * Hides the MiniCart.
		 */
		hide: function(){

			//console.log("[mini-cart.js] hide called.");

			if ( minicart.isTimerRunning() ) {
				minicart.stopAutoCloseTimer();
			}

			$('.minicartcontent').fadeOut( (minicart.fadeOutTimeInSeconds * 1000), function(){
				$('.cart-li').removeClass("active");
			});

		},


		/*
		 * Adds an Item to the cart bus submitting an AJAX request.
		 * 	Then shows the MiniCart and re-enables the AddToCart button.
		 *
		 * @params
		 * 	href: addtocart button href containing the url and parameters
		 *  addToCartButtonElement: Actual DOM element.
		 */
		addItemToCart: function(href, addToCartButtonElement)	{

			var params = "";

			if(href.indexOf("?") != -1){
				params = href.substr(href.indexOf("?"));
			}

			//var url = mo.getServiceUrl('CART_SVC_AddToCart-Service') + params + "&ajax=1";

			// Hide the MiniCart.
			minicart.hide();

			//pcj
			var data001=[{	
							imgSrc:"img/MOTO_G_2ND_WHT_270.png",
							text:"Moto G (2nd Gen.) Global GSM (White) (Global GSM) (White)",
							price:179.99
						}];
			var cartTempl = _.template($('#cartTempl').html(),{data001:data001});
			var data='  <a class="cart minicarttotal" href="cart.html"> <span class="num-items">1</span> </a> '+
  '<div class="minicartcontent"> '+
   '<div class="minicarttop"> '+
    '<div class="extendeditems">'+ 
     '<span class="youjustadded">You\'ve just added</span> '+
     '<span class="qty"> Total items in cart: <span class="q">1</span> </span> '+
    '</div> '+
   '</div> '+
   
   '<div class="checkoutminicart"> '+
    '<ul class="cartList"> '+cartTempl+
          
    '</ul> '+
   '</div> '+
  '</div> '

			// add the product
		/*	$.ajax({
				url	: url,
				context: addToCartButtonElement
			}).done( function(data){*/

				// Update the HTML cart Contents
				minicart.updateHtmlContent(data);

				// Show the MiniCart.
				minicart.show();

				// Don't display the MiniCart if we detect a mobile or tablet viewport (using configurable max width)
				if(document.body.clientWidth < minicart.widthToDisableMiniCartInPixels){
					//window.alert('Item successfully added to cart.');
					minicart.addItemSuccessModal();
				}

				// Re-enable the add-to-cart button
				$(this).removeClass('disabled');
		//	});


		},

		addItemSuccessModal : function(){
			var url = mo.getServiceUrl("CART_SVC_AddToCart-SuccessModal");
			var handler = function(mydata){return mydata;};
			$.ajax({url: url}).done(function(data){
				modal.render(handler, data);
				$(".modal .no, .modal .close, .overlay").on('click', function() {
					modal.close();
				});

				setTimeout( function(){
					$('.modal').fadeOut((minicart.fadeOutTimeInSeconds * 1000), function(){
						modal.close();
					});
				}, minicart.showTimeInSeconds * 1000 );


			});
		},


		/*
		 * Removes Item matching the supplied uuid from the cart by submitting an AJAX request. Then shows the MiniCart.
		 */
		removeCartItem: function(id){

			if(id.indexOf("miniproduct-") != -1) {
				id = id.substr(12);
			} else {
				return "";
			}

			var url = mo.getServiceUrl('CART_SVC_Product-Remove') + "?uuid=" + id + "&ajax=1";

			// Hide the MiniCart.
			minicart.hide();

			//console.log("[mini-cart.js] AJAX cart removal submitting to: " + url);

			// remove the product
			$.ajax({
				url	: url
			}).done( function(data){

				minicart.updateHtmlContent(data);

			}).fail( function(jqXHR, textStatus, errorThrown) {

				//TODO: How to handle this error condition?

				window.alert("There was an error removing from cart");
				console.log("AJAX submission to RemoveFromCart resulted in Error. textStatus: '" + textStatus + "' errorThrown: '" + errorThrown);
			});

		},




		/*
		 * Shows the MiniCart.
		 *
		 * Legacy Action Method, provided for backward compatibility. Use show() instead.
		 *
		 * @depricated
		 */
		slide: function() {
			show();
		},


		/*
		 * Hides the MiniCart.
		 *
		 * Legacy Action Method, provided for backward compatibility. Use hide() instead.
		 * 	Note that param 'delay' is ignored as it has not been implemented with this implementation.
		 *
		 * @depricated
		 */
		close: function(delay) {
			hide();
		},


		/*
		 * Adds an Item to the MiniCart.
		 *
		 * Legacy Action Method, provided for backward compatibility. Use addItemToCart() instead.
		 *
		 * @depricated
		 */
		add: function(href) {
			addItemToCart( href );
		},


		/*
		 * Removes an Item from the MiniCart.
		 *
		 * Legacy Action Method, provided for backward compatibility. Use removeCartItem() instead.
		 *
		 * @depricated
		 */
		remove: function(id) {
			removeCartItem( id );
		}
	}

	minicart.init();

});
