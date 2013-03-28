# -*- encoding : utf-8 -*-
class School < ActiveRecord::Base
  attr_accessible :label
  has_many :class_rooms

  validates_presence_of :label, :message => "Veuillez entrer un nom d'etablissemnet !"
end
