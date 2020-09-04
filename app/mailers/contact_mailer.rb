class ContactMailer < ApplicationMailer
  # Rails.application.credentials.gmail_sub01[:mail]
  # Rails.application.credentials.yahoomail_sub01[:mail]
  def send_customer_mail(contact)
    @contact = contact
    mail(
      from: "お問い合わせ<noreply@gse.com>",
      to: @contact.email,
      subject: "お問い合わせ通知",
    )
  end

  def send_developer_mail(contact)
    @contact = contact
    mail(
      from: "お問い合わせメール<customer_contact@gse.com>",
      to: Rails.application.credentials.gmail_sub01[:mail],
      subject: "お問い合わせ通知",
    )
  end
end
