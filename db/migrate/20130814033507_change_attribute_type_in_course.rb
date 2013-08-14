class ChangeAttributeTypeInCourse < ActiveRecord::Migration
 def self.up
   change_column :courses, :description, :text
   change_column :organizations, :description, :text
  end

  def self.down
   change_column :courses, :description, :string
   change_column :organizations, :description, :string
  end
end
