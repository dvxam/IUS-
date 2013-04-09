# -*- encoding : utf-8 -*-
class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :label

      t.timestamps
    end
  end
end
