class CreateCreditBankAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_bank_addresses do |t|
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.references :credit_bank_general, foreign_key: true

      t.timestamps
    end
  end
end
