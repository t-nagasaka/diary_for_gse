class NotificationMailer < ApplicationMailer
  def send_confirm_to_user(user)
    @user = user
    mail(
      from: "登録ありがとうございます<noreply@gse.com>",
      to: @user.email,
      subject: "お問い合わせ通知",
    )
  end
end
