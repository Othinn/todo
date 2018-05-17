json.extract! project, :id, :project_name, :completed, :created_at, :updated_at
json.url project_url(project, format: :json)
