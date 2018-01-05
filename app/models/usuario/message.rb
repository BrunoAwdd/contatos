class Usuario::Message < ApplicationRecord
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"

  before_save :defaultValues

  def defaultValues
    if (self.status.blank?)
      self.status = 0
    end
    if (self.visualized.blank?)
      self.visualized = 0
    end
  end

  def statusText
    case self.status
      when 0
        'Pendente'
      when 1
        'Resolvido'
      when 2
        'Critico'
    end
  end

  def toName
    if (!self.to.blank?)
      return self.to.myName
    else
      return 'Todos'
    end
  end

  def fromName
    if (!self.from.blank?)
      return self.from.myName
    else
      return ''
    end
  end

  def statusClass
    case self.status
      #info
      #active
      #'success'
      when 0
        'danger'
      when 1
        ''
      when 2
        'warning'
    end
  end

  def interessado?(current_user)
    if (self.to.id == current_user.id || self.from.id == current_user.id || self.to.blank?)
      true
    else
      false
    end
  end

  def visualizedText
    case self.visualized
      when '0'
        return 'Não lido'
      when '1'
        return 'lido'
    end
  end

  def visualizedStyle
    case self.visualized
      when '0'
        return ''
      when '1'
        return '#0099ff'
    end
  end


end
