class AddPastLhobToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :past_lhob, :integer
    add_column :users, :past_lhib, :integer
    add_column :users, :past_rhib, :integer
    add_column :users, :past_rhob, :integer
  end
end
