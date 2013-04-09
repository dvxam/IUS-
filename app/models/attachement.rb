# -*- encoding : utf-8 -*-
class Attachement < ActiveRecord::Base
  belongs_to :post
  belongs_to :comment
  attr_accessible :label, :path, :post_id, :comment_id
end
