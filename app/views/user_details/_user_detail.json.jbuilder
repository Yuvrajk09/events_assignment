json.extract! user_detail, :id, :user_id, :user_email, :user_first_name,
              :password, :user_last_name, :created_at, :updated_at
json.url user_detail_url(user_detail, format: :json)
