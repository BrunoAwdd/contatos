class RemoveFonesenderecoFromContato < ActiveRecord::Migration
  def change
    remove_column :contatos, :mobile_fone, :string
    remove_column :contatos, :business_fone, :string
    remove_column :contatos, :home_fone, :string
    remove_column :contatos, :home_city, :string
    remove_column :contatos, :home_state, :string
    remove_column :contatos, :home_country, :string
    remove_column :contatos, :home_country, :string
    remove_column :enderecos, :endereco, :string
  end
end
