class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.date :date
      t.string :title
      t.text :comment
      t.string :picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
