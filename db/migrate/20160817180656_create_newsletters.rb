class CreateNewsletters < ActiveRecord::Migration[5.0]
  def change
    create_table :newsletters do |t|
      t.string :subject
      t.text :html_message
      t.text :text_message
      t.integer :status

      t.timestamps null: false
    end

    create_table :newsletters_products do |t|
      t.references :newsletter, index: true, foreign_key: true
      t.references :product_general, index: true, foreign_key: true
    end
  end
end
