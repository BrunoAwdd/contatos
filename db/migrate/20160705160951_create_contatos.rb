class CreateContatos < ActiveRecord::Migration[5.0]
  def change
    create_table :contatos do |t|
      t.string :first_name
      t.string :last_name
      t.string :web_page

      t.timestamps null: false
    end

    create_table :product_generals do |t|
      t.string :nome
      t.timestamps null: false
    end
  end
end
