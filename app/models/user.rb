class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :age, :name
  has_many :reviews
  has_many :roles, :dependent => :destroy
  belongs_to :organization #TODO currently if a user creates an Org he is the owner. If he is
                           #then deleted the Org has no admin. Need ensure a user can't be deleted without
                           #setting a new Org owner

  def site_admin?
    self.roles.each do |role|
      if role.permission == 'site_admin'
        return true
      end
    end

    return false
  end
end
