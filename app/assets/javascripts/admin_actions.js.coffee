$ ->
  if window.location.pathname is "/admin/users"
    $('#admin-badge-link').removeClass('active')
    $('#admin-user-link').addClass('active')
    $('.right-side').after("<div class ='mid-flag-user-corner'></div>")
  else
    $('#admin-badge-link').addClass('active')
    $('#admin-user-link').removeClass('active')
    $('.right-side').after("<div class ='mid-flag-badge-corner'></div>")
