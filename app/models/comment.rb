class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_one :attachement
  attr_accessible :content, :post_id, :user_id
end
