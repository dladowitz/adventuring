class Section < ActiveRecord::Base
  attr_accessible :course_id, :end_date, :end_time, :instructor_id, :location, :start_date, :start_time

  belongs_to :course
  belongs_to :instructor
  # has_one :location  #Probably not using this model anymore

  validates_presence_of :course_id, :location

  geocoded_by :location
  after_validation :geocode#, :if => :address_changed? #TODO need to put this back. See Geocoder railscast

  #TODO need to validate sections are created in the future.
end
