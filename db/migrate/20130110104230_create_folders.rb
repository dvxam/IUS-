class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :label
      t.string :path
      t.boolean :isValidated
      t.references :user

      t.timestamps
    end
    add_index :folders, :user_id
  end
end
