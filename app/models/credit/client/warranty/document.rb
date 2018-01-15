class Credit::Client::Warranty::Document < ApplicationRecord
  belongs_to :document_list
  belongs_to :warranty_base
end
