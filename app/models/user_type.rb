# -*- encoding : utf-8 -*-
class UserType < ActiveRecord::Base
  attr_accessible :label
  has_many :users
end
