class AddVendorLinkToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :vendor_link, :string
  end
end
