class Credit::Client::General < ApplicationRecord
  belongs_to :contato
  #One Contato has many telefones
  has_many :emails, inverse_of: :credit_client_general,  foreign_key: 'credit_client_general_id', dependent: :destroy
  accepts_nested_attributes_for :emails, reject_if: proc { |attributes| attributes['email'].blank? }, :allow_destroy => true

  #One Contato has many telefones
  has_many :phones, inverse_of: :credit_client_general, foreign_key: 'credit_client_general_id', dependent: :destroy
  accepts_nested_attributes_for :phones, reject_if: proc { |attributes| attributes['phone'].blank? }, :allow_destroy => true

  #One Contato has many endereços
  has_many :addresses, inverse_of: :credit_client_general, foreign_key: 'credit_client_general_id', dependent: :destroy
  accepts_nested_attributes_for :addresses, reject_if: :reject_address, :allow_destroy => true

  has_many :lines, inverse_of: :credit_client_general, foreign_key: 'credit_client_general_id', dependent: :destroy,
           class_name: "::Credit::Line"
  accepts_nested_attributes_for :lines,
                                :allow_destroy => true, :reject_if => :all_blank
                                #reject_if: proc { |attributes| attributes['credit_bank_general'].blank? || attributes['value'].blank? }

  has_many :documents, inverse_of: :credit_client_general, foreign_key: 'credit_client_general_id', dependent: :destroy
  accepts_nested_attributes_for :documents, :allow_destroy => true, :reject_if => :all_blank

  has_many :notes, inverse_of: :credit_client_general, foreign_key: 'credit_client_general_id', dependent: :destroy
  accepts_nested_attributes_for :notes, :allow_destroy => true, :reject_if => :all_blank

  has_many :legals, inverse_of: :credit_client_general, foreign_key: 'credit_client_general_id', dependent: :destroy, index_errors: true
  accepts_nested_attributes_for :legals, :allow_destroy => true, :reject_if => :all_blank

  has_one :intermediary, inverse_of: :credit_client_general, foreign_key: 'credit_client_general_id', dependent: :destroy
  accepts_nested_attributes_for :intermediary, :allow_destroy => true, :reject_if => :all_blank


  #VALIDATIONS
  validate :raw_cnpj=
  validates :name, presence:true
  validates :brand, presence:true
  validates :cnpj, presence:true, length: {in: 14..15}
  validates :intermediary, presence:false



  def raw_cnpj=
    self.cnpj=cnpj.gsub(/\D/, '')
  end

  def format_cnpj
    if (self.cnpj.length == 15)
      "#{self.cnpj[0..2]}.#{self.cnpj[3..5]}.#{self.cnpj[6..8]}/#{self.cnpj[9..12]}-#{self.cnpj[13-14]}"
    else
      "#{self.cnpj[0..1]}.#{self.cnpj[2..4]}.#{self.cnpj[5..7]}/#{self.cnpj[8..11]}-#{self.cnpj[12-13]}"
    end
  end


  def reject_address(attributes)
    if attributes['country'].blank? && attributes['state'].blank? && attributes['city'].blank?
      true
    else
      false
    end
  end

  def documents_build()
    if (!self.documents.any?)
      Credit::Document.all.each do |document|
        documents_list = [:credit_document_id => document.id]
        self.documents.build(documents_list)
      end
    else
      @idList = Array.new
      self.documents.each do |item|
        @idList.push(Credit::Document.find(item.credit_document_id).id)
      end
      Credit::Document.where.not(id: @idList ).each do |document|
        self.documents.build([:credit_document_id => document.id])
      end
    end
  end

end