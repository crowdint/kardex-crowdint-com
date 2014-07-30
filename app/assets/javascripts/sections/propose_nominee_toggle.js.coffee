$(document).ready ->

  $('.search-proposals-nominate').click (e) ->
    e.preventDefault()
    $('.request-nominee').toggle('slide')
    $('.request-form-nominee').toggle('slide')

  $('.propose-proposal').click (e) ->
    e.preventDefault()
    $('.request-propose').toggle('slide')
    $('.request-form-propose').toggle('slide')

  $('.propose-nomination').click (e) ->
    e.preventDefault()
    $('.request-nominee').toggle('slide')
    $('.request-form-nominee').toggle('slide')

  $('.search-proposals-propose').click (e) ->
    e.preventDefault()
    $('.request-propose').toggle('slide')
    $('.request-form-propose').toggle('slide')


  $('.cancel-proposal').click (e) ->
    e.preventDefault()
    $('.request-propose').hide('slide')
    $('.request-form-propose').hide('slide')

  $('.cancel-nomination').click (e) ->
    e.preventDefault()
    $('.request-nominee').hide('slide')
    $('.request-form-nominee').hide('slide')
