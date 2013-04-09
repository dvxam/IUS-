# -*- encoding : utf-8 -*-
class CreateAttachements < ActiveRecord::Migration
  def change
    create_table :attachements do |t|
      t.string :label
      t.string :path
      t.references :post
      t.references :comment

      t.timestamps
    end
    add_index :attachements, :post_id
    add_index :attachements, :comment_id
  end
end
