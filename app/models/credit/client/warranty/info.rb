class Credit::Client::Warranty::Info < ApplicationRecord
  belongs_to :credit_client_warranty_base

  def format_number(val)
    ActionController::Base.helpers.number_to_currency(val)
  end
end
