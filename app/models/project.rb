class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :delete_all
  validates_presence_of :project_name, length: {minimum: 6, maximum: 255}
  enum project_status: { complete: true, not_complete: false}

  scope :user_projects, ->(user) { where('user_id = ?', user.id) }
  scope :active_project, -> { where(project_status: false)}
  
  def self.recent_created
    order('created_at DESC')
  end
end
