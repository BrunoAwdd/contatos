class AddFieldsToProductGeneral < ActiveRecord::Migration[5.0]
  def change
    add_column :product_generals, :date_entry, :date
    add_reference :product_generals, :contato
    add_reference :product_generals, :intermediary
    add_column :product_generals, :terms, :text
  end
end
