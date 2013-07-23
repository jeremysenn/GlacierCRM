class Todo < ActiveRecord::Base
  attr_accessible :title, :description, :completed, :user_id, :mission_id

  belongs_to :user
  belongs_to :mission

  validates :title, :presence => true
end
