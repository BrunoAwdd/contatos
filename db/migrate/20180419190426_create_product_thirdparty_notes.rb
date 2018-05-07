class CreateProductThirdpartyNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :product_thirdparty_notes do |t|
      t.date :date
      t.text :note

      t.timestamps
    end
  end
end
