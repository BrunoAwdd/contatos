class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.string :first_name
      t.string :last_name
      t.string :web_page

      t.timestamps null: false
    end
  end
end
