# -*- encoding : utf-8 -*-
class CreateAnnexes < ActiveRecord::Migration
  def change
    create_table :annexes do |t|
      t.string :label
      t.references :user

      t.timestamps
    end
    add_index :annexes, :user_id
  end
end
