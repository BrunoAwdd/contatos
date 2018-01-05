class CreateUsuarioMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :usuario_messages do |t|
      t.text :message
      t.string :subject
      t.binary :visualized
      t.integer :status
      t.belongs_to :to, through: :user
      t.belongs_to :from, through: :user
      t.timestamps
    end
  end
end
