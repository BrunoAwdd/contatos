class Credit::Client::Partner::Document < ApplicationRecord
  belongs_to :credit_client_partner_document_list
  belongs_to :credit_client_partner_base
end
