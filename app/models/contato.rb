class Contato < ActiveRecord::Base
  #One-to-Many
  #One Contato has many emails
  has_many :emails, inverse_of: :contato, dependent: :destroy
  accepts_nested_attributes_for :emails, reject_if: proc { |attributes| attributes['email'].blank? }, :allow_destroy => true

  #One Contato has many telefones
  has_many :telefones, inverse_of: :contato, dependent: :destroy
  accepts_nested_attributes_for :telefones, reject_if: proc { |attributes| attributes['telefone'].blank? }, :allow_destroy => true

  #One Contato has many endereços
  has_many :enderecos, inverse_of: :contato, dependent: :destroy
  accepts_nested_attributes_for :enderecos, reject_if: :reject_enderecos, :allow_destroy => true

  #One Contato
  has_many :notes

  has_many :business, class_name: 'Business::General'

  #Many-to-Many
  has_and_belongs_to_many :product_generals, class_name:'Product::General',
                          association_foreign_key: 'product_generals_id'

  has_and_belongs_to_many :credit_client_general, foreign_key: "contato_id", association_foreign_key: "credit_client_id",  join_table: "credit_client_generals_contacts"

  validates :first_name, presence: :true


  #Cria o full_name do Contato
  def full_name
    first_name.blank? ? f_name = '' : f_name = first_name
    last_name.blank? ? l_name = '' : l_name = last_name
    f_name + ' ' + l_name
  end

  def get_telefones
    str_telefones = ''
    len_telefones = telefones.length
    telefones.each do |telefone|
      str_telefones += telefone.full_telefone
      if len_telefones > 1
        str_telefones += "<br>"
      end
    end
    str_telefones
  end

  def get_emails
    str_emails = ''
    len_emails = emails.length

    emails.each do |email|
      str_emails += email.email
      if len_emails > 1
        str_emails += "<br>"
      end
    end
    str_emails
  end

  def get_products
    str_products = ''
    len_products = product_generals.length

    product_generals.each do |product|
      str_products += product.nome
      if len_products > 1
        str_products += ", "
      end
    end
    str_products

  end

  def reject_enderecos(attributes)
    if attributes['estado'].blank? && attributes['cidade'].blank?
      true
    else
      false
    end
  end

  def filters
    filter.id = ''
    filter.name = ''
    filter.email = ''
    filter.telefone = ''
  end

end
