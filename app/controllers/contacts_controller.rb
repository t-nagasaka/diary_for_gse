class ContactsController < ApplicationController
  before_action :contact_params, except: :new

  def new
    @contact = Contact.new
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  def create
    contact = Contact.create!(contact_params)
    if contact.save
      ContactMailer.send_customer_mail(contact).deliver_now
      ContactMailer.send_developer_mail(contact).deliver_now
      flash.now[:notice] = "送信完了しました。"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:last_name, :first_name, :email, :inquiry)
  end
end
