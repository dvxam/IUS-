class PostsUsers < ActiveRecord::Migration
  def self.up
    create_table 'posts_users', :id => false do |t|
      t.column :users_id, :integer
      t.column :posts_id, :integer
    end
  end
end
