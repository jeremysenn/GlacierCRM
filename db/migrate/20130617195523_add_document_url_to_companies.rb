class AddDocumentUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :document_url, :string
  end
end
