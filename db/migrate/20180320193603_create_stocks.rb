class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :company
      t.string :ticker
      t.decimal :price
      t.decimal :dividend
      t.boolean :type
      t.string :class

      t.timestamps
    end
  end
end
