class ClassRoom < ActiveRecord::Base
  belongs_to :school
  has_many :posts
  has_many :users
  attr_accessible :label, :school_id
end