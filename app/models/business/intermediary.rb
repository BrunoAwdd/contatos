class Business::Intermediary < ApplicationRecord
  belongs_to :business_general
  belongs_to :contato, foreign_key: 'contato_id'
  accepts_nested_attributes_for :contato, :allow_destroy => true, :reject_if => :all_blank
end
