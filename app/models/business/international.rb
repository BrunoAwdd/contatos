class Business::International < Business::General
    belongs_to :product_general, -> {where(type: 'Product::International')},  class_name:'Product::General'
end