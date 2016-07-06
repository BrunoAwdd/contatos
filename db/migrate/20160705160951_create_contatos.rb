class CreateContatos < ActiveRecord::Migration
  def change
    create_table :contatos do |t|
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.string :email
      t.string :email2
      t.string :home_fone
      t.string :business_fone
      t.string :mobile_fone
      t.string :home_city
      t.string :home_state
      t.string :home_country
      t.string :notes
      t.string :web_page

      t.timestamps null: false
    end
  end
end
