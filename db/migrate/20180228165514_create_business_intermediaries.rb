class CreateBusinessIntermediaries < ActiveRecord::Migration[5.0]
  def change
    create_table :business_intermediaries do |t|
      t.text :note
      t.references :business_general, foreign_key: true
      t.references :contato, foreign_key: true

      t.timestamps
    end
  end
end
