class CreateClientsAndContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_client_generals_contacts do |t|
      t.belongs_to :credit_client, index: true, foreign_key: { to_table: "credit_client_generals"}
      t.belongs_to :contato, index: true
    end
    #remove_column :credit_client_generals, :contato_id
  end
end
