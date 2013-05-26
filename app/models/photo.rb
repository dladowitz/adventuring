class Photo < ActiveRecord::Base
  attr_accessible :organization_id, :course_id, :image

  belongs_to :organization
  belongs_to :course

  has_attached_file :image, :styles => { :medium => "300x300>", square: '200x200>', :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
