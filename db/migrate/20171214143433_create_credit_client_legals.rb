class CreateCreditClientLegals < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_legals do |t|
      t.string :number
      t.date :date
      t.text :note
      t.references :credit_client_general, foreign_key: true

      t.timestamps
    end
  end
end
