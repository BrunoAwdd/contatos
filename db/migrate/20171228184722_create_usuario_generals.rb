class CreateUsuarioGenerals < ActiveRecord::Migration[5.0]
  def change
    create_table :usuario_generals do |t|
      t.string :name
      t.string :last_name
      t.references :usuario_roles
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
