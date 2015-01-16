require 'bcrypt'

class User < ActiveRecord::Base
  has_many :tweets
  has_many :followers, through: :followings
  has_many :leaders, through: :followings

  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
