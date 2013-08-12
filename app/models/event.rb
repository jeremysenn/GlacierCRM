class Event < ActiveRecord::Base
  attr_accessible :title, :description, :user_id, :contact_id, :mission_id, :starts_at, :ends_at, :where

  belongs_to :user
  belongs_to :contact
  belongs_to :mission

  has_many :documents, :as => :documentable,  :dependent => :destroy

  accepts_nested_attributes_for :documents, :allow_destroy => true, :reject_if => lambda { |a| a[:document].blank? }
end
