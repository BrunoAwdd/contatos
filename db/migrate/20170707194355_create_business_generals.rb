class CreateBusinessGenerals < ActiveRecord::Migration[5.0]
  def change
    create_table :business_generals do |t|
      t.datetime :date_entry
      t.string :subject
      t.references :contato, foreign_key: true
      t.references :product_general, foreign_key: true

      t.timestamps
    end
  end
end
