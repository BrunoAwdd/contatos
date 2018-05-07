class AddTypeToProductGeneral < ActiveRecord::Migration[5.0]
  def change
    add_column :product_generals, :type, :string
  end
end
