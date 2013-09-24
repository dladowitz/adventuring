class AddLatitudeAndLongitudeToSection < ActiveRecord::Migration
  def change
    add_column :sections, :latitude, :float
    add_column :sections, :longitude, :float
  end
end
