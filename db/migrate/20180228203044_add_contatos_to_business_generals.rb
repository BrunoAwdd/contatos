class AddContatosToBusinessGenerals < ActiveRecord::Migration[5.0]
  def change
    ActiveRecord::Base.connection.tables

    if !ActiveRecord::Base.connection.table_exists? 'business_generals_contacts'
      create_table :business_generals_contacts, id: false do |t|
        t.belongs_to :business_generals, index: true
        t.belongs_to :contato, index: true
      end
    end

    remove_foreign_key :business_generals, :contatos
    remove_column :business_generals, :contato_id, :integer

  end
end
