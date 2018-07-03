class User < ApplicationRecord
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :name, :email
  has_secure_password
  enum role: [ :admin, :user ]
  has_many :user_gifs
end
