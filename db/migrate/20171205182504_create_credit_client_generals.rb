class CreateCreditClientGenerals < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_generals do |t|
      t.string :name
      t.string :brand
      t.string :cnpj
      t.string :status
      t.references :contato

      t.timestamps
    end
  end
end
