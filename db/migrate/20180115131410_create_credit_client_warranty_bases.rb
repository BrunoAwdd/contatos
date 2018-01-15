class CreateCreditClientWarrantyBases < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_warranty_bases do |t|
      t.string :name
      t.references :credit_client_general, foreign_key: true

      t.timestamps
    end
  end
end
