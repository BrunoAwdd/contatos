class Credit::Client::Partner::Document < ApplicationRecord
  belongs_to :document_list, foreign_key: 'document_list_id'
  belongs_to :partner_base, foreign_key: 'partner_base'
end
