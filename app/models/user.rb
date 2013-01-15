class User < ActiveRecord::Base
  belongs_to :class_room
  belongs_to :user_type
  has_many :postsAsReceiver, :class_name => 'Post', :foreign_key => 'receiver_id'
  has_many :postsAsSender, :class_name => 'Post', :foreign_key => 'sender_id'
  attr_accessible :avatar, :firstname, :is_validated, :mail, :name, :password, :class_room_id, :user_type_id
  has_one :folder
  has_many :annexs

  after_initialize :set_defaults

  def set_defaults
    self.avatar ||= "http://placehold.it/50x50"
    self.is_validated ||= false
  end

  def to_s
    "#{firstname} #{name}"
  end
end
