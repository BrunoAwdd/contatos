class CreateCreditClientPartnerDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_partner_documents do |t|
      t.integer :status
      t.integer :exemption
      t.date :date
      t.references :credit_client_partner_document_list, foreign_key: true
      t.references :credit_client_partner_base, foreign_key: true

      t.timestamps
    end
  end
end
