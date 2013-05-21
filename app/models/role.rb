class Role < ActiveRecord::Base
  attr_accessible :organization_id, :permission, :user_id
  role_types = ['owner', 'admin', 'user', 'site_admin']

  belongs_to :user
  belongs_to :organization
  validates_presence_of :organization_id, :user_id, :permission
  validates :permission, :inclusion => { :in => role_types }
end
