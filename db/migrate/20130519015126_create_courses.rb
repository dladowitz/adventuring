class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.integer :organization_id
      t.integer :float

      t.timestamps
    end
  end
end
