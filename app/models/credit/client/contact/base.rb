class Credit::Client::Contact::Base < ApplicationRecord
  belongs_to :credit_client_general

  has_one :email, inverse_of: :credit_client_contact_base,  foreign_key: 'contact_base_id', dependent: :destroy,  class_name: "Credit::Client::Contact::Email"
  accepts_nested_attributes_for :email, reject_if: proc { |attributes| attributes['email'].blank? }, :allow_destroy => true

  #One Contato has many telefones
  has_one :phone, inverse_of: :credit_client_contact_base, foreign_key: 'contact_base_id', dependent: :destroy, class_name: "Credit::Client::Contact::Phone"
  accepts_nested_attributes_for :phone, reject_if: proc { |attributes| attributes['phone'].blank? }, :allow_destroy => true
end
