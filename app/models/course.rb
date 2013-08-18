class Course < ActiveRecord::Base
  attr_accessible :description, :name, :organization_id, :price, :active, :instructor_id, :location, :start_date, :end_date, :start_time, :end_time
  belongs_to :organization
  has_many :photos, :dependent => :destroy
  has_many :sections
  has_many :instructors, :through => :sections

  validates_presence_of :organization_id, :name, :location


  def unique_locations
    # Gets first four unique locations course it held at.
    # Not sure why this this method needs '.all' included, but it does.
    sections = self.sections.all.uniq{|section| section.location}
    sections = sections[0..3]
  end

  def next_dates
    # Gets the next five sections being offered
    sections = self.sections.reject{|section| section.start_date < DateTime.now }
    sections = sections.sort_by{|section| section.start_date}
    sections = sections[0..4]
  end
end
