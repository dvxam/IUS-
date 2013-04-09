# -*- encoding : utf-8 -*-
class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string :label

      t.timestamps
    end
  end
end
