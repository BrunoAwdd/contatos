class Credit::Client::Warranty::Document < ApplicationRecord
  belongs_to :document_list
  belongs_to :warranty_base

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
    frequency = self.document_list.frequencyDays
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

  def expiredClass
    if self.expired?
      return "danger"
    end
  end

  def expiredText
    self.expired? ?  'Vencido' : '-';
  end

  def expiredDays
    return (Date.today-self.date).to_i
  end
end
