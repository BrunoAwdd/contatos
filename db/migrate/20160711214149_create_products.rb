class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nome

      t.timestamps null: false
    end

    create_table :contatos_products do |t|
      t.belongs_to :contato
      t.belongs_to :product
    end
  end
end
