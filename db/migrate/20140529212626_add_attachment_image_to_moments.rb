class AddAttachmentImageToMoments < ActiveRecord::Migration
  def self.up
    change_table :moments do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :moments, :image
  end
end
