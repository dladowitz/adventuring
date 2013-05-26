class AddOrganizaionIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :organization_id, :integer
  end
end
