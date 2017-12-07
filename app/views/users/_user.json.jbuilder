json.extract! user, :id, :email, :crypted_password, :password_salt, :created_at, :updated_at
json.url user_url(user, format: :json)
