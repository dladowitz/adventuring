// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  // alert('yes')

  //Autocomplete for search box on homepage. TODO: Hook up some kind of search with results
  $(function() {
    $( ".search_box" ).autocomplete({
      source: availableSports
    });
  });

  //cycles though images on course show page
  $('.main_image_section').cycle({
    fx:      'scrollRight',
    next:   '.arrow',
    timeout:  0,
    speed: 1500,
    easing:  'easeInOutBack',
  });

  //set main image sizes
  // console.log($('.main .main_image img').width())
  // if( $('.main .main_image img').width() > 400 ){
  //   $('.main .course_content .main_image img').css('width', '100% ')
  // }

  //sets company logo size
  var logoHeight = $('.company img').height()
  var logoWidth = $('.company img').width()

  $('.company .image').css({height: logoHeight, width: logoWidth})

  //Sports for search bar
  var availableSports = [
    "Auto Racing",
    "Base Jumping",
    "Bull Riding",
    "Canyoneering",
    "Cave Diving",
    "Cliff Diving",
    "Hang Gliding",
    "Kayaking",
    "Kiteboarding",
    "Motocross",
    "Mountain Biking",
    "Mountaineering",
    "Motorcyle Racing",
    "Paragliging",
    "Rock Climbing",
    "Sailing",
    "Scuba Diving",
    "Skydiving",
    "White Water Rafting",
    "Wind Surfing",
    "Wing Suit",
  ]
});
