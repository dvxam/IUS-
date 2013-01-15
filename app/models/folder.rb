class Folder < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  attr_accessible :isValidated, :label, :path, :user_id

  def set_defaults
    self.is_validated ||= false
  end
end
