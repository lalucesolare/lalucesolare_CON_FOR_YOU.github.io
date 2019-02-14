class CreateLikevideos < ActiveRecord::Migration
  def change
    create_table :likevideos do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :video, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
