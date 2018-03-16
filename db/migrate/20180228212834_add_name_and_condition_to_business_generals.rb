class AddNameAndConditionToBusinessGenerals < ActiveRecord::Migration[5.0]
  def change
    add_column :business_generals, :name, :string
    add_column :business_generals, :conditions, :text
  end
end
