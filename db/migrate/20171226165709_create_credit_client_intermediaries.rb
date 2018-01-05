class CreateCreditClientIntermediaries < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_intermediaries do |t|
      t.string :name
      t.text :note
      t.references :credit_client_general, foreign_key: true

      t.timestamps
    end
  end
end