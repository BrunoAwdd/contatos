class Business::General < ActiveRecord::Base
  belongs_to :contato, class_name:'Contato', foreign_key: 'contato_ids'
  belongs_to :product_general, class_name:'Product::General', foreign_key: 'product_general_ids'

  #One-to-Many
  #One Contato has many emails
  has_many :histories, foreign_key: "business_general_id"
  #accepts_nested_attributes_for :histories
  #, reject_if: proc { |attributes| attributes['note'].blank? or attributes['date_entry'].blank? }, :allow_destroy => true

  has_many :notes, foreign_key: "business_general_id"
  accepts_nested_attributes_for :notes, reject_if: proc { |attributes| attributes['note'].blank? }, :allow_destroy => true
end
