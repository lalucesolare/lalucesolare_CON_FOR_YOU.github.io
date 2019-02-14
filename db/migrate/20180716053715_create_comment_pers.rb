class CreateCommentPers < ActiveRecord::Migration
  def change
    create_table :comment_pers do |t|
      t.string :content
      t.belongs_to :performance, index: true, foreign_key: true
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
