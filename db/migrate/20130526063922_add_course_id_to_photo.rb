class AddCourseIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :course_id, :integer
  end
end
