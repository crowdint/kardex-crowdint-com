window.App ||= {}

class App.User
  constructor: ->

  users: []

  getData: ->
    $get = $.get('/users/user_names.json')
    $get.success (response) =>
      for element in response
        @users.push({ label: element.name, id: element.id })

  addDataToAutocomplete: ->
    $user = $('#user')
    $user.bind('keydown', (event) ->
      if event.keyCode is $.ui.keyCode.TAB and $user.autocomplete('instance').menu.active
        event.preventDefault()
    ).autocomplete(
      minLength: 3
      source: (request, response) =>
        response(
          $.ui.autocomplete.filter(@users, @extractLast(request.term))
        )
      focus: -> false
      select: (event, ui) =>
        terms = @split($user.value)
        terms.pop()
        terms.push(ui.item.value)
        terms.push('')
        $user.value = terms.join(', ')
        false
    )

  split: (val) ->
    val.split(/,\s*/)

  extractLast: (term) ->
    @split(term).pop()

$(document).ready ->
  window.info = new App.User()
  info.getData()
  info.addDataToAutocomplete()
