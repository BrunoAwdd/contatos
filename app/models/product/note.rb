class Product::Note < ApplicationRecord
  belongs_to :product_general, foreign_key: 'product_id'
end
