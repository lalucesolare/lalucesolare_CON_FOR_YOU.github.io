class CreateCommentPhotos < ActiveRecord::Migration
  def change
    create_table :comment_photos do |t|
      t.text :content
      t.belongs_to :photo, index: true, foreign_key: true
      
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
