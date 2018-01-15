class Credit::Client::Warranty::DocumentList < ApplicationRecord
  validates :name, presence: true
  validates :frequency_unity, presence: true
  validates :frequency_number, presence: true, length: {in: 1..12}

  def frequencyUnityText
    case self.frequency_unity
      when 0
        'Sem Periodicidade'
      when 1
        'Semanal'
      when 2
        'Mensal'
      when 3
        'Anual'
    end
  end

  def frequencyDays
    variant = 0
    if (!self.frequency_unity.blank? && !self.frequency_number.blank?)
      case self.frequency_unity
        when 0
          variant = 0
        when 1
          variant = 7
        when 2
          variant = 30
        when 3
          variant = 360
      end
      return variant * self.frequency_number
    end
  end
end
