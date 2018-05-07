class Credit::Client::Document < ApplicationRecord
  belongs_to :credit_client_general, class_name: 'Credit::Client::General'
  belongs_to :credit_document, class_name: 'Credit::Document'

  def statusText
    if (status == 0)
      '<strong>Pendente</strong>'
    else
      'Entregue'
    end
  end

  def exemptionText
    if (exemption == 0)
      '-'
    else
      'Não exigido'
    end
  end

  def expired?
    frequency = self.credit_document.frequencyDays
    if (!self.date.blank? && frequency  != 0)
      if (self.expiredDays > frequency)
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def expiredText
    self.expired? ?  'Vencido' : '-';
  end

  def expiredDays
    return (Date.today-self.date).to_i
  end

  def expiredClass
    if self.expired?
      return "danger"
    end
  end


end
