class AddAttachmentCoverToResources < ActiveRecord::Migration[4.2]
  def self.up
    change_table :resources do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :resources, :cover
  end
end
