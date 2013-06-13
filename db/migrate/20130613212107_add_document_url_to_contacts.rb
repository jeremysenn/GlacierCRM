class AddDocumentUrlToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :document_url, :string
  end
end
