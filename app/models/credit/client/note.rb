class Credit::Client::Note < ApplicationRecord
  belongs_to :credit_client_general
  belongs_to :credit_bank_general, class_name: '::Credit::Bank::General'
  validates :date, format: {with: /^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/, multiline: true}
end
