class CreateMailposts < ActiveRecord::Migration
  def change
    create_table :mailposts do |t|
      t.string :title
      t.string :email
      t.text :content

      t.timestamps null: false
    end
  end
end
