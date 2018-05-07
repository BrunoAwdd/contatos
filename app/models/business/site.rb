class Business::Site < Business::General
    #belongs_to :product_general #, -> {where(type: 'Product::Site')},  class_name:'Product::General'
end