class ChangePostColumName < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :id, :author_id
  end
end
