# -*- encoding : utf-8 -*-
class Tag < ActiveRecord::Base
  attr_accessible :label
  has_and_belongs_to_many :folders
end
