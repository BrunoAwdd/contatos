class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :subject
      t.text :html_message
      t.text :text_message
      t.integer :status

      t.timestamps null: false
    end
  end
end
