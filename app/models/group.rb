class Group < ActiveRecord::Base
  has_many :permissions
  has_many :users
end