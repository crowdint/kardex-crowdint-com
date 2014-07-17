$ ->
  if window.location.pathname is "/admin/users"
    $('#admin-badge-link').removeClass('active')
    $('#admin-user-link').addClass('active')
  else
    $('#admin-badge-link').addClass('active')
    $('#admin-user-link').removeClass('active')
