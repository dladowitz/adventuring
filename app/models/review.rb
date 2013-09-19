class Review < ActiveRecord::Base
  attr_accessible :content, :organization_id, :rating, :user_id, :course_id
  belongs_to :user
  belongs_to :organization
  belongs_to :course


  validates_presence_of :user_id, :content
end
