class CreateEnderecos < ActiveRecord::Migration[5.0]
  def change
    create_table :enderecos do |t|
      t.string :tipo
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :pais
      t.references :contato, index: true, foreign_key: true

      t.timestamps null: false
    end
  end

end
