class Chatroom < ActiveRecord::Base
  attr_accessible :name

  has_many :messages
  has_many :users
end
