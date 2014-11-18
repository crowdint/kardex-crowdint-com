class AdminModuleMailer < ActionMailer::Base

  def admin_module(user, new_admin, admin_module)
    @user = user
    @new_admin = new_admin
    @module = admin_module
    mail(
      from: @user.email,
      to: @new_admin.email,
      subject: 'Kardex: You have recived new privileges!'
    )
  end
end
