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

  has_many :retweets
  has_many :tweets, through: :retweets

  has_many :active_friends

  has_many :friends, dependent: :destroy

  has_many :active_friends, class_name:  "Friends", foreign_key: "follower_id", dependent: :destroy

  has_many :following, through: :active_friends, source: :followed

  has_many :followeds, through: :active_friends
  has_many :following, through: :active_friends, source: :followed

end
