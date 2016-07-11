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

  #Many-to-Many
  has_and_belongs_to_many :products



  #Cria o full_name do Contato
  def full_name
    first_name.blank? ? f_name = '' : f_name = first_name
    last_name.blank? ? l_name = '' : l_name = last_name
    f_name + ' ' + l_name
  end

  def reject_enderecos(attributes)
    if attributes['pais'].blank? && attributes['estado'].blank? && attributes['cidade'].blank?
      true
    else
      false
    end
  end

end
