class CreateCreditClientWarrantyDocumentsLists < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_warranty_documents_lists do |t|
      t.string :name
      t.integer :frequency_unity
      t.integer :frequency_number

      t.timestamps
    end
  end
end