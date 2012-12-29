class AddAttachmentDocumentToAttachments < ActiveRecord::Migration
  def self.up
    change_table :attachments do |t|
      t.has_attached_file :document
    end
  end

  def self.down
    drop_attached_file :attachments, :document
  end
end
