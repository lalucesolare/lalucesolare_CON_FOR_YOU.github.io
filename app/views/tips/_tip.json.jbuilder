json.extract! tip, :id, :title, :image, :content, :created_at, :updated_at
json.url tip_url(tip, format: :json)
