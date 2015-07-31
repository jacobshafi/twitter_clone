require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  validates_presence_of :password, :on => :create
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20}
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  has_many :tweets, dependent: :destroy

  has_many :following_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: :following_relationships, source: :followed

  has_many :follower_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

end
