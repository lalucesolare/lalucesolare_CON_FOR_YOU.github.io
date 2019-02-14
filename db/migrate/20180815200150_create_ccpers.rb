class CreateCcpers < ActiveRecord::Migration
  def change
    create_table :ccpers do |t|
      t.text :content
      t.belongs_to :comment_per, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
