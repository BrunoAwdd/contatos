class CreateCreditClientAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_addresses do |t|
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.references :credit_client_general, foreign_key: true

      t.timestamps
    end
  end
end
