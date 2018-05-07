class CreateProductsSellers < ActiveRecord::Migration[5.0]
  def change
    create_table :products_sellers do |t|
      t.references :product_general
      t.references :contato
    end
  end
end
