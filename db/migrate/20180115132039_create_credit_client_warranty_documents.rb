class CreateCreditClientWarrantyDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_warranty_documents do |t|
      t.integer :status
      t.integer :exemption
      t.date :date
      t.references :document_list, foreign_key: true, references: "credit_client_warranty_documents_lists"
      t.references :warranty_base, foreign_key: true, references: "credit_client_warranty_bases"

      t.timestamps
    end
  end
end
