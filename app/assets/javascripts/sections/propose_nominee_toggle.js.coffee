$(document).ready ->

  $('.search-proposals-nominate').click (e) ->
    e.preventDefault()
    $('.request-nominee').toggle('slide')
    $('.request-form-nominee').toggle('slide')

  $('.search-proposals-propose').click (e) ->
    e.preventDefault()
    $('.request-propose').toggle('slide')
    $('.request-form-propose').toggle('slide')

  $('.js-propose-proposal').click (e) ->
    e.preventDefault()
    $('.request-propose').slideDown('slide')
    $('.request-form-propose').slideDown('slide')

  $('.js-propose-nomination').click (e) ->
    e.preventDefault()
    $('.request-nominee').slideDown('slide')
    $('.request-form-nominee').slideDown('slide')

  $('.js-cancel-proposal').click (e) ->
    e.preventDefault()
    $('.request-propose').hide('slide')
    $('.request-form-propose').hide('slide')

  $('.js-cancel-nomination').click (e) ->
    e.preventDefault()
    $('.request-nominee').hide('slide')
    $('.request-form-nominee').hide('slide')
