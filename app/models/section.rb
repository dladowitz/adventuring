class Section < ActiveRecord::Base
  attr_accessible :course_id, :end_date, :end_time, :instructor_id, :location, :start_date, :start_time

  belongs_to :course
  belongs_to :instructor
end
