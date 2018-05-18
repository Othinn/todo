class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :delete_all
  validates_presence_of :task_name, :deadline, :priority
  enum priority: { low: 1, normal: 2, high: 3}

  def self.order_by_deadline
    order('deadline DESC')
  end
end
