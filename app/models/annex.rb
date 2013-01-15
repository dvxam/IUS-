class Annex < ActiveRecord::Base
  belongs_to :user
  attr_accessible :label
end
