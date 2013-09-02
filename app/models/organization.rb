class Organization < ActiveRecord::Base
  attr_accessible :description, :name, :phone_num, :website, :logo

  has_many :reviews, :dependent => :destroy
  has_many :users
  has_many :courses, :dependent => :destroy
  has_many :roles, :dependent => :destroy
  has_many :photos, :dependent => :destroy
  has_many :instructors, :dependent => :destroy
  validates_presence_of :name

  has_attached_file :logo, :styles => { :medium => "300x300>", square: '200x200>', :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  #only works while orgs have only one owner
  def owner
    self.roles.each do |role|
      if role.permission == 'owner'
        return User.find(role.user_id)
      end
    end
  end

  # returns an array of permission levels for a user
  def permission_levels_for(user)
    permission_levels = []
    roles.each do |role|
      if User.find(role.user_id) == user
        permission_levels << role.permission
      end
    end

    permission_levels
  end

  # only turn on if organizations can have multiple owners
  # def owner=(user)
  #   self.roles.create(:user_id => user.id, :permission => 'owner')
  # end
end
