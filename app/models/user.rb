class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile_photo
  attr_accessible :age, :name
  has_many :reviews
  has_many :roles, :dependent => :destroy
  belongs_to :organization #TODO currently if a user creates an Org he is the owner. If he is
                           #then deleted the Org has no admin. Need ensure a user can't be deleted without
                           #setting a new Org owner

  has_attached_file :profile_photo, :styles => { :medium => "300x300>", square: '200x200>', :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  def site_admin?
    self.roles.each do |role|
      if role.permission == 'site_admin'
        return true
      end
    end

    return false
  end

  def org_owner?
    self.roles.each do |role|
      if role.permission == 'owner'
        return true
      end
    end

    return false
  end

  def orgs_owned
    orgs =[]
    self.roles.each do |role|
      if role.permission == 'owner'
        orgs << role.organization
      end
    end

    orgs
  end

  def other_org_owners?(org)
    org.roles.each do |role|
      if role.permission == 'owner' && role.user != self
        return true
      end
    end

    return false
  end



end
