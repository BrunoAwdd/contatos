class CreateProductThirdpartyBases < ActiveRecord::Migration[5.0]
  def change
    create_table :product_thirdparty_bases do |t|
      t.string :name
      t.date :date_entry
      t.references :contato
      t.references :intermediary
      t.text :terms

      t.timestamps
    end
  end
end
