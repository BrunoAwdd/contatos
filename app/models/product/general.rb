class Product::General < ActiveRecord::Base
  has_and_belongs_to_many :contatos
  has_and_belongs_to_many :newsletters
  has_many :documents, foreign_key: 'product_generals_id'
end
