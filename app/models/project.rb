class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :delete_all
  validates_presence_of :project_name, length: {minimum: 6, maximum: 255}

  def complete?
    tasks.all?(&:complete?)
  end

  def all_task_number
    tasks.count
  end

  def completed_tasks_number
    tasks.where(task_status: true).count
  end

end
