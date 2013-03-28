# -*- encoding : utf-8 -*-
class AddSenderIdAndReceiverIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :sender_id, :int
    add_column :posts, :receiver_id, :int
  end
end
