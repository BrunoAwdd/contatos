class Product::General < ActiveRecord::Base
  has_and_belongs_to_many :contatos, foreign_key: 'product_generals_id', class_name: 'Contato'
  has_and_belongs_to_many :sellers, association_foreign_key: 'contato_id', foreign_key: 'product_general_id', join_table:'products_sellers', class_name: 'Contato'
  has_and_belongs_to_many :newsletters
  has_many :documents, foreign_key: 'product_generals_id'
  has_many :notes, -> {order( :data)}, foreign_key: 'product_general_id', dependent: :destroy, inverse_of: :product_general

  accepts_nested_attributes_for :notes, :allow_destroy => true, :reject_if => :all_blank




  scope :international, -> {where(type: 'Product::International')}

  def typeRedeable
    case self.type
      when 'Product::International'
        return 'Operação Internacional'
      else
        return 'Sem Categoria'
    end
  end


end
