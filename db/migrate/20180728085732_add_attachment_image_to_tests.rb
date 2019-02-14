class AddAttachmentImageToTests < ActiveRecord::Migration
  def self.up
    change_table :tests do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tests, :image
  end
end
