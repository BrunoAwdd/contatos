class CreateCreditBankEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_bank_emails do |t|
      t.string :email
      t.references :credit_bank_general, foreign_key: true

      t.timestamps
    end
  end
end
