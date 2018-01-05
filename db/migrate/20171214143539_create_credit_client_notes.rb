class CreateCreditClientNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_notes do |t|
      t.text :note
      t.date :date
      t.references :credit_client_general, foreign_key: true

      t.timestamps
    end
  end
end
