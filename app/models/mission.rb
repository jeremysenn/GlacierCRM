class Mission < ActiveRecord::Base
  attr_accessible :title, :description, :user_id, :completed, :date, :priority, :contact_id, :documents_attributes

  belongs_to :user
  belongs_to :contact
  has_many :todos
  has_many :documents, :as => :documentable,  :dependent => :destroy
  has_many :tasks

  accepts_nested_attributes_for :documents, :allow_destroy => true, :reject_if => lambda { |a| a[:document].blank? }
end
