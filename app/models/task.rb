class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :delete_all
  validates_presence_of :task_name
end
