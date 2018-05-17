json.extract! project, :id, :project_name, :completed, :belongs_to, :created_at, :updated_at
json.url project_url(project, format: :json)
