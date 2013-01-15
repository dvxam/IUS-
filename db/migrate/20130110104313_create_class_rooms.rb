class CreateClassRooms < ActiveRecord::Migration
  def change
    create_table :class_rooms do |t|
      t.string :label
      t.references :school

      t.timestamps
    end
    add_index :class_rooms, :school_id
  end
end
