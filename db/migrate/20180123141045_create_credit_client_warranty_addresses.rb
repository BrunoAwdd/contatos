class CreateCreditClientWarrantyAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_warranty_addresses do |t|
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.references :warranty_base, foreign_key: { to_table: "credit_client_warranty_bases"}

      t.timestamps
    end
  end
end
