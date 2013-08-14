class Instructor < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :organization_id, :profile_photo

  belongs_to :organization
  has_many :courses

  validates_presence_of :organization_id

  has_attached_file :profile_photo, :styles => { :medium => "300x300>", square: '200x200>', :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"


  def last_name_initial
    last_name[0]
  end

end
