json.extract! comment, :id, :belongs_to, :content, :img_url, :created_at, :updated_at
json.url comment_url(comment, format: :json)
