class CreateCommentTips < ActiveRecord::Migration
  def change
    create_table :comment_tips do |t|
      t.string :content
      t.belongs_to :tip, index: true, foreign_key: true

      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
