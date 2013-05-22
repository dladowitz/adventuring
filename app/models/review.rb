class Review < ActiveRecord::Base
  attr_accessible :content, :organization_id, :rating, :user_id
  belongs_to :user
  belongs_to :organization


  validates_presence_of :organization_id, :user_id, :content
end
