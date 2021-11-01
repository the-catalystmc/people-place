class FixColumnNames < ActiveRecord::Migration[6.1]
  def change
    change_table :posts do |t|
      t.rename :author_id, :id
      t.rename :user_id, :author_id
      end
  end
end
