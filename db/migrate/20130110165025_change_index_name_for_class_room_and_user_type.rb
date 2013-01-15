class ChangeIndexNameForClassRoomAndUserType < ActiveRecord::Migration
  def up
    rename_column(:users, :classRoom_id, :class_room_id)
    rename_column(:users, :userType_id, :user_type_id)
    rename_column(:posts, :classRoom_id, :class_room_id)
  end

  def down
    rename_column(:users, :class_room_id, :classRoom_id)
    rename_column(:users, :user_type_id, :userType_id)
    rename_column(:posts, :class_room_id, :classRoom_id)
  end
end
