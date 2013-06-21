class Todo < ActiveRecord::Base
  attr_accessible :title, :description, :completed, :user_id, :project_id

  belongs_to :user
#  belongs_to :project

  validates :title, :presence => true
end
