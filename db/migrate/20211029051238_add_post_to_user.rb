class AddPostToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :user, :string
    add_index :posts, :user
  end
end
