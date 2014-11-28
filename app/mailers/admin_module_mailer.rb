class AdminModuleMailer < ActionMailer::Base

  def admin_module(new_admin, admin_module)
    @new_admin = new_admin
    @module = admin_module
    mail(
      from: 'kardex@crowdint.com',
      to: @new_admin.email,
      subject: 'Kardex: You have recived new privileges!'
    )
  end
end
