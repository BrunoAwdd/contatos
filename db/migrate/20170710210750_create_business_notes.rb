class CreateBusinessNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :business_notes do |t|
      t.text :note
      t.references :business_general, foreign_key: true

      t.timestamps
    end
  end
end
