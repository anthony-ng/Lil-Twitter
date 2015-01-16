require 'bcrypt'

class User < ActiveRecord::Base
  has_many :tweets
  has_many :following_followers, class_name: 'Following', foreign_key: :leader_id
  has_many :following_leaders, class_name: 'Following', foreign_key: :follower_id
  has_many :followers, through: :following_followers, class_name: 'User'
  has_many :leaders, through: :following_leaders, class_name: 'User'

  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
