$(document).ready ->

  $('input[type="checkbox"]').click ->
    if $(this).attr('value') is 'true'
      $('.terna-select').toggle('slide')
    return
  return
