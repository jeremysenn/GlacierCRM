class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :title
      t.string :document
      t.references :documentable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
