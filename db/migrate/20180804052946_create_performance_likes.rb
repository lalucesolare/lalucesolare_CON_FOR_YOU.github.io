class CreatePerformanceLikes < ActiveRecord::Migration
  def change
    create_table :performance_likes do |t|
      t.references :performance, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
