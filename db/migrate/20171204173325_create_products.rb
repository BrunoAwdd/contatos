class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :product_documents do |t|
      t.string :name
      t.references :product_generals, index: true, foreign_key: true
      t.timestamps null: false
    end

    create_table :contatos_product_generals do |t|
      t.belongs_to :contato
      t.belongs_to :product_generals
    end

  end
end
