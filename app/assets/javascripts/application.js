// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
// Make sure 'jquery.remotipart' goes after jquery_ujs
//
//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require ckeditor-jquery
//= require jquery-ui
//= require bootstrap
//= require ckeditor/ckeditor
//= require timepicker
//= require google_analytics
//= require_tree .


// 'course' class could have conflicts as its name is used on both Course Index and Company Show

// slides up and down over course images on Course index page.
  $('.course').hover(
    function(){$(this).find('.index_page_overlay').slideDown()},
    function(){$(this).find('.index_page_overlay').slideUp()}
  );


// slides up and down over course images on company show page.
  $('.course').hover(
    function(){$(this).find('.course_overlay').slideDown()},
    function(){$(this).find('.course_overlay').slideUp()}
  );

// Probably don't need this. Used :hover instead.
// highlights aside section
  // $('.section').mouseover(function(){
  //     $('.section').addClass("")
  //   }
  // );

// adds background highlight to show where user is in aisde bar
  $(function(){
    var str=location.href; // location.href is the current page link
    // console.log(str)

    $('aside a').each(function() {
      // console.log(this.href)
      if(str === this.href) {
        // console.log ("matched!!")
        $(this).find('div').addClass('active_section')  // finds first decendent div
      }
    });
  })

// configs for ckeditor_rails gem
  // $('.ckeditor').ckeditor({
    // optional config
  // });
