class CreateJuridicoAndamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :juridico_andamentos do |t|
      t.text :nota
      t.datetime :data
      t.references :juridico_processo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
