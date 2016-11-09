$( document ).on('turbolinks:load', function() {
  $(".dealer_button").on('click', function(event){
		//event.preventDefault();
		$('.dealer_inputs').toggle();
	});

  $('select#ad_country').on('change', function (e) {
    var valueSelected = this.value;
    if (valueSelected != "LV") {
      $('.city_select').hide();
      $('.not_lv_city_input').show();
    }
    else {
      $('.not_lv_city_input').hide();
      $('.city_select').show();
    }
  });

  // Center modal
  function centerModals(){
    $('.modal').each(function(i){
      var $clone = $(this).clone().css('display', 'block').appendTo('body');
      var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
      top = top > 0 ? top : 0;
      $clone.remove();
      $(this).find('.modal-content').css("margin-top", top);
    });
  }
  $('.modal').on('show.bs.modal', centerModals);
  $(window).on('resize', centerModals);

  $(".filterrific_form select").chosen({
    disable_search_threshold: 100
  });
});
