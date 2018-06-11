json.extract! profile, :id, :user_id, :bio, :dob, :created_at, :updated_at
json.url profile_url(profile, format: :json)
