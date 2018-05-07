class Business::General < ActiveRecord::Base
  delegate :international, :national, :site, to: :product_general

  has_and_belongs_to_many :contatos, class_name:'Contato', foreign_key: "business_generals_id", association_foreign_key: "contato_id",  join_table: "business_generals_contacts"
  accepts_nested_attributes_for :contatos
  belongs_to :product_general,  class_name:'Product::General'

  #One-to-Many
  #One Contato has many emails
  has_many :histories, foreign_key: "business_general_id"
  accepts_nested_attributes_for :histories, reject_if: proc { |attributes| attributes['note'].blank? or attributes['date_entry'].blank? }, :allow_destroy => true

  has_many :notes, foreign_key: "business_general_id"
  accepts_nested_attributes_for :notes, reject_if: proc { |attributes| attributes['note'].blank? }, :allow_destroy => true

  has_many :intermediary_contatos, class_name: '::Contato', foreign_key: 'business_general_id', through: :intermediaries, :source => 'contato'
  accepts_nested_attributes_for :intermediary_contatos, :allow_destroy => true, :reject_if => :all_blank

  has_many :intermediaries, class_name: 'Business::Intermediary',  inverse_of: :business_general, foreign_key: 'business_general_id', dependent: :destroy
  accepts_nested_attributes_for :intermediaries, :allow_destroy => true, :reject_if => :all_blank

  def getType
    case self.type
      when 'Business::International'
        return 'Operação Internacional'
      when 'Business::National'
        return 'Negocios'
      when 'Business::Site'
        return 'Consulta Site'
    end
  end

end

