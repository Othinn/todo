class Comment < ApplicationRecord
  belongs_to :task
  validates_presence_of :content
  mount_uploader :image, ImageUploader
end
