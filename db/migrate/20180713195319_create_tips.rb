class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :title
      t.string :image
      t.text :content
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
