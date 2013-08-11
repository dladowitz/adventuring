// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  // alert('yes')

  //Autocomplete for search box on homepage. TODO: Hook up some kind of search with results
  $(function() {
    var availableSports = ["Rock Climbing", "Sailing", "Scuba Diving", "Canyoneering", "Mountianeering", "Skydiving", "Paragliging", "Mountain Biking", "White Water Rafting", "Hang Gliding",
      "Base Jumping", "Kayaking", "Motorcyle Racing", "Auto Racing", "Cave Diving", "Bull Riding", "Motocross"];

    $( ".search_box" ).autocomplete({
      source: availableSports
    });
  });

  //slides up and down over course images on home page
  $('.course').hover(
    function(){$(this).find('.index_page_overlay').slideDown()},
    function(){$(this).find('.index_page_overlay').slideUp()}
  );

});
