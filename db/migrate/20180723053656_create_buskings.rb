class CreateBuskings < ActiveRecord::Migration
  def change
    create_table :buskings do |t|
      t.date :day
      t.string :place
      t.string :name
      t.string :image
      t.text :content
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
