class CreateCommentComus < ActiveRecord::Migration
  def change
    create_table :comment_comus do |t|
      t.string :content
      t.belongs_to :post, index: true, foreign_key: true
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
