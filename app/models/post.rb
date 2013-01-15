class Post < ActiveRecord::Base
  belongs_to :class_room
  belongs_to :receiver, :class_name => 'User'
  belongs_to :sender, :class_name => 'User'
  has_many :attachement
  has_many :comments
  attr_accessible :content, :subject, :sender_id, :receiver_id, :class_room_id
end
