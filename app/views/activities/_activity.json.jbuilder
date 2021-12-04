json.extract! activity, :id, :name, :amount, :user_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
