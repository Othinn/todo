json.extract! task, :id, :task_name, :task_progress, :belongs_to, :priority, :deadline, :created_at, :updated_at
json.url task_url(task, format: :json)
