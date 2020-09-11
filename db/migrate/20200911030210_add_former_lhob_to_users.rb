class AddFormerLhobToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :former_lhob, :integer
    add_column :users, :former_lhib, :integer
    add_column :users, :former_rhib, :integer
    add_column :users, :former_rhob, :integer
  end
end
