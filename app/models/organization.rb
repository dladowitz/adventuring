class Organization < ActiveRecord::Base
  attr_accessible :description, :name, :phone_num, :website

  has_many :reviews
  has_many :users
  has_many :courses
  has_many :roles
  validates_presence_of :name

  #only works while orgs have only one owner
  def owner
    self.roles.each do |role|
      if role.permission == 'owner'
        return User.find(role.user_id)
      end
    end
  end


  # only turn on if organizations can have multiple owners
  # def owner=(user)
  #   self.roles.create(:user_id => user.id, :permission => 'owner')
  # end
end
