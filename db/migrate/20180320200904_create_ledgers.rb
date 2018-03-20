class CreateLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :ledgers do |t|
      t.integer :user_id
      t.integer :stock_id
      t.boolean :holding?

      t.timestamps
    end
  end
end
