// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('.start_date').datetimepicker({
  timeFormat: "hh:mm tt",

  // Currently rolling everything into start_date
  // altField: '.start_time'
});

$('.end_date').datetimepicker({
  timeFormat: "hh:mm tt",

  // Currently rolling everything into end_date
  // altField: '.end_time'
});
