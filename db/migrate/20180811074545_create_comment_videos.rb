class CreateCommentVideos < ActiveRecord::Migration
  def change
    create_table :comment_videos do |t|
      t.text :content
      t.belongs_to :video, index: true, foreign_key: true
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
