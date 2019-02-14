class CreateLiketips < ActiveRecord::Migration
  def change
    create_table :liketips do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :tip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
