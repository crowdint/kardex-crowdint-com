$(document).ready ->
  $('#filter-date').datepicker
    daysOfWeekDisabled: "0,1,2,4,5,6"
    autoclose: true
    format: "yyyy/mm/dd"

  $('#select-date').datepicker
    daysOfWeekDisabled: "0,1,2,4,5,6"
    autoclose: true
    format: "yyyy-mm-dd"

  $('#filter-date-users').datepicker
    daysOfWeekDisabled: "0,1,2,4,5,6"
    autoclose: true
    format: "yyyy-mm-dd"

  $('#filter-date-users').on 'changeDate', ->
    $('#filter-form-users').submit()

  $('#filter-date').on 'changeDate', ->
    $('#filter-form').submit()