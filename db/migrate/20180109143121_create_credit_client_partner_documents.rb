class CreateCreditClientPartnerDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_partner_documents do |t|
      t.integer :status
      t.integer :exemption
      t.date :date
      t.references :document_list,  foreign_key: { to_table: "credit_client_partner_document_lists"}
      t.references :partner_base,  foreign_key: { to_table: "credit_client_partner_bases"}

      t.timestamps
    end
  end
end
