json.extract! user, :id, :name, :email, :pass_hash, :rem_hash, :created_at, :updated_at
json.url user_url(user, format: :json)
