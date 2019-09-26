require 'sinatra/activerecord'
class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, with: /^[A-Za-z0-9]+$/, presence: true
end
