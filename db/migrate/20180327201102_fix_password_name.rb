class FixPasswordName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :pass_hash, :password_digest
  end
end
