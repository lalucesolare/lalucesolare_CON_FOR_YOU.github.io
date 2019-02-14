class CreateLikepers < ActiveRecord::Migration
  def change
    create_table :likepers do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :performance, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
