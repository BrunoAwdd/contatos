class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :email
      t.references :contato, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
