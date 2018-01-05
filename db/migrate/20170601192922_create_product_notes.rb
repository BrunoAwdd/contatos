class CreateProductNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :product_notes do |t|
      t.text :nota
      t.datetime :data
      t.references :product_general, foreign_key: true

      t.timestamps
    end
  end
end
