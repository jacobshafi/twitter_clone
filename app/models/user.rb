require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  validates_presence_of :password, :on => :create
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20}
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
