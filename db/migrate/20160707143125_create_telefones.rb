class CreateTelefones < ActiveRecord::Migration[5.0]
  def change
    create_table :telefones do |t|
      t.string :tipo
      t.string :ddd
      t.string :telefone
      t.references :contato, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
