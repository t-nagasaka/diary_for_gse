class ChangePastLhobOfUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :past_lhob, :integer, default: 1
    change_column :users, :past_lhib, :integer, default: 3
    change_column :users, :past_rhib, :integer, default: 7
    change_column :users, :past_rhob, :integer, default: 15
  end
end
