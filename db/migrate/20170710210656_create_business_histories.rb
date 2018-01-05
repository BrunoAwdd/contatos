class CreateBusinessHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :business_histories do |t|
      t.datetime :data_entry
      t.text :note
      t.references :business_general, foreign_key: true

      t.timestamps
    end
  end
end
