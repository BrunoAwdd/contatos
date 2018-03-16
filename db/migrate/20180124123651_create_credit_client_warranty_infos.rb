class CreateCreditClientWarrantyInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_warranty_infos do |t|
      t.integer :value
      t.text :notes
      t.integer :price
      t.text :condition
      t.references :warranty_base, foreign_key: { to_table: "credit_client_warranty_bases"}

      t.timestamps
    end
  end
end
