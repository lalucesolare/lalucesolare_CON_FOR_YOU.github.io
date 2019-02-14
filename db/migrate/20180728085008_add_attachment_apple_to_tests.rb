class AddAttachmentAppleToTests < ActiveRecord::Migration
  def self.up
    change_table :tests do |t|
      t.attachment :apple
    end
  end

  def self.down
    remove_attachment :tests, :apple
  end
end
