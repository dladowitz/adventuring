// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

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

  // Marks first image is primary
  $('.image_group .primary_image:first').html("Primary Image")
  $('.image_group:first').addClass("primary_image_group")

  //Sports for search bar
  var availableSports = [
    "Auto Racing",
    "Base Jumping",
    "Bull Riding",
    "Car Racing",
    "Canyoneering",
    "Cave Diving",
    "Cliff Diving",
    "Free Base Jumping",
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
    "Snowboarding",
    "Skydiving",
    "Surfing",
    "White Water Rafting",
    "Wind Surfing",
    "Wing Suit",
  ]

// need to extract into a method. Super undry
  $('#nav_link_info').click(function(){
    $('span').removeClass('active_nav')
    $(this).addClass('active_nav')
    $('#info_box').show();
    $('#public_box').show();
    $('#delete_box').show();
    $('#images_box').hide();
    $('#sections_box').hide();
  });

  $('#nav_link_images').click(function(){
    $('span').removeClass('active_nav')
    $(this).addClass('active_nav')
    $('#images_box').show();
    $('#info_box').hide();
    $('#sections_box').hide();
    $('#public_box').hide();
    $('#delete_box').hide();
  });

  $('#nav_link_sections').click(function(){
    $('span').removeClass('active_nav')
    $(this).addClass('active_nav')
    $('#sections_box').show();
    $('#info_box').hide();
    $('#images_box').hide();
    $('#public_box').hide();
    $('#delete_box').hide();
  });


  // course/edit.html.haml
  // For editing course attributes.
  // Shows and Hides course attributes
  $('.main .main_content .info .editable_course_info td.second_cell').click(function(){
    $(this).hide();
    $(this).parent().find('td.third_cell').show();
  });

  // Updates values from input box to default view. Saves to database.
  $('.main .main_content .info .editable_course_info td.third_cell .update_button').click(function(){
    var updatedText = $(this).parent().parent().find('input').val();

    $(this).parent().parent().find('.third_cell').hide();
    if(updatedText.length > 0){
      $(this).parent().parent().find('.second_cell').html(updatedText);
    };
    $(this).parent().parent().find('.second_cell').show();
  });

  //Makes fields look editable on hover
  $('.main .main_content .info .editable_course_info td.second_cell').hover(
    function(){$(this).css({cursor: 'pointer', color: 'blue'})},
    function(){$(this).css('color', 'rgb(75, 75, 75)')}
  );

  $('.main .main_content .info .editable_course_info td.second_cell').hover(
    function(){$(this).parent().find('#edit_icon').show()},
    function(){$(this).parent().find('#edit_icon').hide()}
  );



});
