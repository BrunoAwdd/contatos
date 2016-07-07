class Contato < ActiveRecord::Base

  has_many :emails, inverse_of: :contato, dependent: :destroy
  has_many :telefones, inverse_of: :contato, dependent: :destroy
  has_many :enderecos, inverse_of: :contato, dependent: :destroy


  accepts_nested_attributes_for :emails, reject_if: proc { |attributes| attributes['email'].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :telefones, reject_if: proc { |attributes| attributes['telefone'].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :enderecos, :allow_destroy => true


  #Cria o full_name do Contato
  def full_name
    first_name.blank? ? f_name = '' : f_name = first_name
    last_name.blank? ? l_name = '' : l_name = last_name
    f_name + ' ' + l_name
  end

end
