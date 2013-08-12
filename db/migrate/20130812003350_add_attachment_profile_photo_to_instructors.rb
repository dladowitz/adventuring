class AddAttachmentProfilePhotoToInstructors < ActiveRecord::Migration
  def self.up
    change_table :instructors do |t|
      t.attachment :profile_photo
    end
  end

  def self.down
    drop_attached_file :instructors, :profile_photo
  end
end
