class RemoveFloatFromCourse < ActiveRecord::Migration
  def up
    remove_column :courses, :float
  end

  def down
    add_column :courses, :float, :integer
  end
end
