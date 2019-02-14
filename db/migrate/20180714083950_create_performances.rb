class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.date :day
      t.string :title
      t.string :image
      t.string :second
      t.text :content
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end