class Course < ActiveRecord::Base
  attr_accessible :active, :description, :end_date, :end_time, :name, :instructor_id, :organization_id, :price, :rank, :start_date, :start_time, :external_link

  belongs_to :organization

  has_many :instructors, :through => :sections
  has_many :photos, :dependent => :destroy
  has_many :sections

  validates_presence_of :organization_id, :name
  validates_numericality_of :price


  def next_dates
    # Gets the next five sections being offered
    sections = self.sections.reject{|section| section.start_date < DateTime.now }
    sections = sections.sort_by{|section| section.start_date}
    sections = sections[0..4]
  end

  def unique_locations
    # Gets first four unique locations course it held at.
    # Not sure why this this method needs '.all' included, but it does.
    sections = self.sections.all.uniq{|section| section.location}
    sections = sections[0..3]
  end

end
