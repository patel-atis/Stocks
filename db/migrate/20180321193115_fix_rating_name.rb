class FixRatingName < ActiveRecord::Migration[5.1]
  def change
    rename_column :stocks, :class, :rating
  end
end
