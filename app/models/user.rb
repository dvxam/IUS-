class User < ActiveRecord::Base
  authenticates_with_sorcery!
  belongs_to :class_room
  belongs_to :user_type
  has_many :postsAsReceiver, :class_name => 'Post', :foreign_key => 'receiver_id'
  has_many :postsAsSender, :class_name => 'Post', :foreign_key => 'sender_id'
  attr_accessible :avatar, :firstname, :is_validated, :mail, :name, :password, :class_room_id, :user_type_id, :password, :password_confirmation
  has_one :folder
  has_many :annexs

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  after_initialize :set_defaults

  def set_defaults
    self.avatar ||= "http://placehold.it/62x67"
    self.is_validated ||= false
    self.user_type_id ||= 1
  end

  def to_s
    "#{firstname} #{name}"
  end
end
