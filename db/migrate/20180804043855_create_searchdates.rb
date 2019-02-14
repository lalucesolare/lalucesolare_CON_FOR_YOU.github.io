class CreateSearchdates < ActiveRecord::Migration
  def change
    create_table :searchdates do |t|
      t.date :day
      t.string :title
      t.string :image
      t.text :content

      t.timestamps null: false
    end
  end
end
