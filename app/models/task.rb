class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :delete_all
  validates_presence_of :task_name, :deadline, :priority
  enum priority: { Low: 1, Normal: 2, High: 3}
  enum task_status: { complete: true, not_complete: false }


  def self.order_by_deadline
    order(priority: :desc)
  end
end
