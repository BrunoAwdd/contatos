class AddTypeToBusinessGeneral < ActiveRecord::Migration[5.0]
  def change
    add_column :business_generals, :type, :string
  end
end
