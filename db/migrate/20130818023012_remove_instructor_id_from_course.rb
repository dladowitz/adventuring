class RemoveInstructorIdFromCourse < ActiveRecord::Migration
  def up
    remove_column :courses, :instructor_id
  end

  def down
    add_column :courses, :instructor_id, :integer
  end
end
