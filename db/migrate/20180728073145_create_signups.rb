class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :post
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
