json.extract! comment, :id, :content, :img_url, :created_at, :updated_at
json.url comment_url(comment, format: :json)
