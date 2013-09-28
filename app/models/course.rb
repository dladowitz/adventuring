class Course < ActiveRecord::Base
  attr_accessible :active, :description, :end_date, :end_time, :name, :instructor_id, :organization_id, :price, :rank, :start_date, :start_time, :external_link

  belongs_to :organization

  has_many :instructors, :through => :sections
  has_many :photos, :dependent => :destroy
  has_many :sections
  has_many :reviews

  validates_presence_of :organization_id, :name
  validates_numericality_of :price

  def self.text_search(query)
    if query.present?
      search(query)
    else
      # This returns all courses orded by rank
      scoped#(:order => 'rank DESC')
      #thing
    end
  end

  def next_dates(number_of_dates = nil)
    # Gets a specified number of next sections being offered
    sections = []
    self.sections.each do |section|
      next unless section.start_date
      ### Probably need to go back and look at the time as well as date
      sections << section if section.start_date > Date.today
    end
    sections = sections.sort_by{|section| section.start_date}

    if number_of_dates
      sections = sections[0..number_of_dates]
    else
      sections
    end
  end

  def unique_locations
    # Gets first four unique locations course it held at.
    # Not sure why this this method needs '.all' included, but it does.
    sections = self.sections.all.uniq{|section| section.location}
    sections = sections[0..3]
  end

end
