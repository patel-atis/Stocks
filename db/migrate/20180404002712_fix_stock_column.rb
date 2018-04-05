class FixStockColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :stocks, :type, :preferred
  end
end
