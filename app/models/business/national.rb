class Business::National < Business::General
    belongs_to :product_general, -> {where(type: 'Product::National')},  class_name:'Product::General'
end