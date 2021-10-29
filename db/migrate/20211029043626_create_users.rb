class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.bio :text
      t.posts_counter :integer
      t.photo :string

      t.timestamps
    end
  end
end
