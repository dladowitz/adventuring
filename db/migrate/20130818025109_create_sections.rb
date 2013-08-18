class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :course_id
      t.datetime :start_date
      t.datetime :end_date
      t.time :start_time
      t.time :end_time
      t.string :location
      t.integer :instructor_id

      t.timestamps
    end
  end
end
