class CreateCommentBuskings < ActiveRecord::Migration
  def change
    create_table :comment_buskings do |t|
      t.string :content
      t.belongs_to :busking, index: true, foreign_key: true
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
