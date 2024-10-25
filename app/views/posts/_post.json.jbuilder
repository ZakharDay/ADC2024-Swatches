json.extract! post, :id, :title, :teaser, :body, :user_id, :swatch_id, :created_at, :updated_at
json.url post_url(post, format: :json)
