class Organization < ActiveRecord::Base
  attr_accessible :description, :name, :phone_num, :website

  has_many :reviews
  has_many :users
  has_many :courses
  validates_presence_of :name
end
