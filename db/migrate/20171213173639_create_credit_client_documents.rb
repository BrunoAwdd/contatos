class CreateCreditClientDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_documents do |t|
      t.integer :status
      t.integer :exemption
      t.date :date
      t.references :credit_client_general, foreign_key: true
      t.references :credit_document, foreign_key: true

      t.timestamps
    end
  end
end
