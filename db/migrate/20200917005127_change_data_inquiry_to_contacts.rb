class ChangeDataInquiryToContacts < ActiveRecord::Migration[6.0]
  def change
    change_column :contacts, :inquiry, :text
  end
end
