class CreateJuridicoProcessos < ActiveRecord::Migration
  def change
    create_table :juridico_processos do |t|
      t.string :number
      t.integer :category
      t.string :author
      t.string :defendant
      t.datetime :date
      t.string :shire
      t.string :circuit
      t.string :value
      t.string :judge
      t.string :classe
      t.integer :free
      t.text :notes

      t.timestamps null: false
    end
  end
end
