//  Place all the behaviors and hooks related to the matching controller here.
//  All this logic will automatically be available in application.js.

// For editing profile attributes.
// Shows and Hides profile attributes
$('.main .main_content .info .editable_organization_info td.second_cell').click(function(){
  $(this).hide();
  $(this).parent().find('td.third_cell').show();
});

// Updates values from input box to default view. Saves to database.
$('.main .main_content .info .editable_organization_info td.third_cell .update_button').click(function(){
  var updatedText = $(this).parent().parent().find('input').val();

  $(this).parent().parent().find('.third_cell').hide();
  if(updatedText.length > 0){
    $(this).parent().parent().find('.second_cell').html(updatedText);
  };
  $(this).parent().parent().find('.second_cell').show();
});

//Makes fields look editable on hover
$('.main .main_content .info .editable_organization_info td.second_cell').hover(
  function(){$(this).css({cursor: 'pointer', color: 'blue'})},
  function(){$(this).css('color', 'rgb(75, 75, 75)')}
);

$('.main .main_content .info .editable_organization_info td.second_cell').hover(
  function(){$(this).parent().find('#edit_icon').show()},
  function(){$(this).parent().find('#edit_icon').hide()}
);
