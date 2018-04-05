class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :relationships, :followed, :followed_id
    rename_column :relationships, :follower, :follower_id
  end
end
