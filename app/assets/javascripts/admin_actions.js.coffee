$ ->
  switch window.location.pathname
    when '/admin/users'
      $('#admin-mvp-link').removeClass('active')
      $('#admin-badge-link').removeClass('active')
      $('#admin-user-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-user-corner'></div>")
    when '/admin/badges'
      $('#admin-user-link').removeClass('active')
      $('#admin-mvp-link').removeClass('active')
      $('#admin-badge-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-user-corner'></div>")
    else
      $('#admin-user-link').removeClass('active')
      $('#admin-badge-link').removeClass('active')
      $('#admin-mvp-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-badge-corner'></div>")
