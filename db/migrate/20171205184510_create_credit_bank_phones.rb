class CreateCreditBankPhones < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_bank_phones do |t|
      t.string :ddd
      t.string :phone
      t.string :model
      t.references :credit_bank_general, foreign_key: true

      t.timestamps
    end
  end
end
