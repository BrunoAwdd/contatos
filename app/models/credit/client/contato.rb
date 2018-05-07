class Credit::Client::Contato < ApplicationRecord
  belongs_to :credit_client_general
  belongs_to :contato, class_name: "::Contato"
  accepts_nested_attributes_for :contato

  self.table_name = "credit_client_generals_contacts"


end

