# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :firstname
      t.string :avatar
      t.string :mail
      t.string :password
      t.boolean :is_validated
      t.references :classRoom
      t.references :userType

      t.timestamps
    end
    add_index :users, :classRoom_id
    add_index :users, :userType_id
  end
end
