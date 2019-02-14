json.extract! signup, :id, :post, :title, :content, :created_at, :updated_at
json.url signup_url(signup, format: :json)
