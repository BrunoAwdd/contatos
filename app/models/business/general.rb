class Business::General < ActiveRecord::Base
  has_and_belongs_to_many :contatos, class_name:'Contato', foreign_key: "business_generals_id", association_foreign_key: "contato_id",  join_table: "business_generals_contacts"
  accepts_nested_attributes_for :contatos
  belongs_to :product_general, class_name:'Product::General', foreign_key: 'product_general_ids'

  #One-to-Many
  #One Contato has many emails
  has_many :histories, foreign_key: "business_general_id"
  #accepts_nested_attributes_for :histories
  #, reject_if: proc { |attributes| attributes['note'].blank? or attributes['date_entry'].blank? }, :allow_destroy => true

  has_many :notes, foreign_key: "business_general_id"
  accepts_nested_attributes_for :notes, reject_if: proc { |attributes| attributes['note'].blank? }, :allow_destroy => true

  has_one :intermediary, inverse_of: :business_general, foreign_key: 'business_general_id', dependent: :destroy
  accepts_nested_attributes_for :intermediary, :allow_destroy => true, :reject_if => :all_blank

end
