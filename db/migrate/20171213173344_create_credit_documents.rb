class CreateCreditDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_documents do |t|
      t.string :name
      t.integer :frequency_unity
      t.integer :frequency_number

      t.timestamps
    end
  end
end
