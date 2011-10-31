$(function() {

	// if the function argument is given to overlay,
	// it is assumed to be the onBeforeLoad event listener
  $(".signup-modal").overlay({
  
    mask: {
  		color: '#bbb',
  		loadSpeed: 200,
  		opacity: 0.9
  	},
    effect: 'apple',
    
    closeOnClick: false,

    onBeforeLoad: function() {

    // grab wrapper element inside content
    var wrap = this.getOverlay().find(".content-wrap");

    // load the page specified in the trigger
    wrap.load(this.getTrigger().attr("href"));
   }
  
  });
  
  $("#signupForm").submit(function(e) {
    // close the overlay
    triggers.eq(1).overlay().close();
    var input = $("input", this).val();
    triggers.eq(1).html(input);
    return e.preventDefault();
  });
  
});
