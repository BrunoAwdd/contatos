class Credit::Bank::General < ApplicationRecord
  belongs_to :contato

  #One Contato has many telefones
  has_many :emails, inverse_of: :credit_bank_general, foreign_key: 'credit_bank_general_id', dependent: :destroy
  accepts_nested_attributes_for :emails, reject_if: proc { |attributes| attributes['email'].blank? }, :allow_destroy => true

  #One Contato has many telefones
  has_many :phones, inverse_of: :credit_bank_general, foreign_key: 'credit_bank_general_id', dependent: :destroy
  accepts_nested_attributes_for :phones, reject_if: proc { |attributes| attributes['phone'].blank? }, :allow_destroy => true

  #One Contato has many endereços
  has_many :addresses, inverse_of: :credit_bank_general, foreign_key: 'credit_bank_general_id', dependent: :destroy
  accepts_nested_attributes_for :addresses, reject_if: :reject_address, :allow_destroy => true

  has_many :lines, inverse_of: :credit_bank_general, foreign_key: 'credit_bank_general_id', dependent: :destroy,
           class_name: "::Credit::Line"
  accepts_nested_attributes_for :lines, :allow_destroy => true

  def reject_address(attributes)
    if attributes['country'].blank? && attributes['state'].blank? && attributes['city'].blank?
      true
    else
      false
    end
  end

  def full_name
    name.blank? ? f_name = '' : f_name = name
    agency.blank? ? l_name = '' : l_name = agency
    f_name + ' ' + l_name
  end
end
