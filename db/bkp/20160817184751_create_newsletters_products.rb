class CreateNewsletterProducts < ActiveRecord::Migration
  def change
    create_table :newsletters_products do |t|
      t.references :newsletter, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
    end
  end
end
