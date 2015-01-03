$ ->
  deselectAll = () ->
    $('.admin-settings-control .nav li a').removeClass('active')

  switch window.location.pathname
    when '/admin/users'
      $('#admin-user-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-user-corner'></div>")
    when '/admin/badges'
      $('#admin-badge-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-badge-corner'></div>")
    when '/admin/workshops'
      $('#admin-workshop-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-workshop-corner'></div>")
    when '/admin/presentations'
      $('#admin-show-dont-tell-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-show-dont-tell-corner'></div>")
    when '/admin/feedbook'
      $('#admin-feedbook-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-feedbook-corner'></div>")
    else
      $('#admin-mvp-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-badge-corner'></div>")
