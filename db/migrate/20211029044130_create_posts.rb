class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.comments_counter :integer
      t.likes_counter :integer

      t.timestamps
    end
  end
end
