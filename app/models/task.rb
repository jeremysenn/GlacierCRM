class Task < ActiveRecord::Base
  attr_accessible :title, :description, :contact_id, :user_id, :mission_id, :completed, :due_at, :documents_attributes

  belongs_to :user
  belongs_to :contact
  belongs_to :mission

  has_many :documents, :as => :documentable,  :dependent => :destroy

  accepts_nested_attributes_for :documents, :allow_destroy => true, :reject_if => lambda { |a| a[:document].blank? }
end
