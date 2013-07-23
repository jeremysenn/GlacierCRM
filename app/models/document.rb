class Document < ActiveRecord::Base
  attr_accessible :title, :document, :documentable_id, :documentable_type

  mount_uploader :document, DocumentUploader

  belongs_to :documentable, :polymorphic => true

  validates :title,  :presence => true
end
