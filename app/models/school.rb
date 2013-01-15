class School < ActiveRecord::Base
  attr_accessible :label
  has_many :class_rooms
end
