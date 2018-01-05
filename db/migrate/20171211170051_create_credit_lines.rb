class CreateCreditLines < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_lines do |t|
      t.string :name
      t.string :value
      t.text :note
      t.date :date
      t.integer :status
      t.references :credit_bank_general, foreign_key: true
      t.references :credit_client_general, foreign_key: true

      t.timestamps
    end
  end
end
