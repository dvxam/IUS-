# -*- encoding : utf-8 -*-
class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :content
      t.references :classRoom
      t.references :user

      t.timestamps
    end
    add_index :posts, :classRoom_id
    add_index :posts, :user_id
  end
end
