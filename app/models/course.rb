class Course < ActiveRecord::Base
  attr_accessible :description, :name, :organization_id, :price
  belongs_to :organization
  has_many :photos, :dependent => :destroy

  validates_presence_of :organization_id
  validates_presence_of :name
end
