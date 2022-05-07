json.extract! user,
              :id,
              :name,
              :email
json.links do
  json.user_url admin_user_url(user)
end
json.extract! user,
              :created_at,
              :updated_at
