class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :observacao
      t.references :contato, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
