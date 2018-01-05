class CreateCreditBankGenerals < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_bank_generals do |t|
      t.string :name
      t.string :agency
      t.references :contato, foreign_key: true

      t.timestamps
    end
  end
end
