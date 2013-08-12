class Course < ActiveRecord::Base
  attr_accessible :description, :name, :organization_id, :price, :active, :instructor_id
  belongs_to :organization
  has_many :photos, :dependent => :destroy
  belongs_to :instructor

  validates_presence_of :organization_id
  validates_presence_of :name
end
