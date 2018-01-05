class Credit::Line < ApplicationRecord
  belongs_to :credit_bank_general, class_name: 'Credit::Bank::General'
  belongs_to :credit_client_general, class_name: 'Credit::Client::General'

  validates :credit_bank_general_id, presence: true

  def get_status
    if (status == 0)
      'Pendente'
    elsif (status == 1)
      'Aprovado'
    end
  end

  def format_number
    ActionController::Base.helpers.number_to_currency(self[:value])
  end

end
