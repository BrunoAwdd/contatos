class AddConditionsToCreditClientGeneral < ActiveRecord::Migration[5.0]
  def change
    add_column :credit_client_generals, :condition, :text
  end
end
