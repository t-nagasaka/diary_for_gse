class RemoveFormerLhobFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :former_lhob, :integer
    remove_column :users, :former_lhib, :integer
    remove_column :users, :former_rhib, :integer
    remove_column :users, :former_rhob, :integer
  end
end
