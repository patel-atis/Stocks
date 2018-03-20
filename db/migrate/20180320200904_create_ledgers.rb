class CreateLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :ledgers do |t|
      t.integer :user_id
      t.integer :stock_id
      t.boolean :holding? #this is true until the user stops holding the stock

      t.timestamps
    end
  end
end
