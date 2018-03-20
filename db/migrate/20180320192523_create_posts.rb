class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :stock_id
      t.string :user_id
      t.string :content

      t.timestamps
    end
  end
end
