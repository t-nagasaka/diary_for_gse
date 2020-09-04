# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def Contact
    contact = Contact.new(last_name: "山田太郎", inquiry: "問い合わせメッセージ")

    ContactMailer.send_mail(contact)
  end
end
