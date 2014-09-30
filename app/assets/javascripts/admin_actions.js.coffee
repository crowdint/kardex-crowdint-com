$ ->
  switch window.location.pathname
    when '/admin/users'
      $('#admin-mvp-link').removeClass('active')
      $('#admin-badge-link').removeClass('active')
      $('#admin-user-link').addClass('active')
      $('#admin-workshop-link').removeClass('active')
      $('#admin-show-dont-tell-link').removeClass('active')
      $('.right-side').after("<div class ='mid-flag-user-corner'></div>")
    when '/admin/badges'
      $('#admin-user-link').removeClass('active')
      $('#admin-mvp-link').removeClass('active')
      $('#admin-badge-link').addClass('active')
      $('#admin-workshop-link').removeClass('active')
      $('#admin-show-dont-tell-link').removeClass('active')
      $('.right-side').after("<div class ='mid-flag-badge-corner'></div>")
    when '/admin/workshops'
      $('#admin-user-link').removeClass('active')
      $('#admin-mvp-link').removeClass('active')
      $('#admin-badge-link').removeClass('active')
      $('#admin-show-dont-tell-link').removeClass('active')
      $('#admin-workshop-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-workshop-corner'></div>")
    when '/admin/show_dont_tells'
      $('#admin-user-link').removeClass('active')
      $('#admin-mvp-link').removeClass('active')
      $('#admin-badge-link').removeClass('active')
      $('#admin-workshop-link').removeClass('active')
      $('#admin-show-dont-tell-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-workshop-corner'></div>")  
    else
      $('#admin-user-link').removeClass('active')
      $('#admin-badge-link').removeClass('active')
      $('#admin-workshop-link').removeClass('active')
      $('#admin-show-dont-tell-link').removeClass('active')
      $('#admin-mvp-link').addClass('active')
      $('.right-side').after("<div class ='mid-flag-badge-corner'></div>")
