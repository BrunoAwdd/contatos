class Juridico::Processo < ActiveRecord::Base
  has_many :andamentos
  accepts_nested_attributes_for :andamentos,
                                reject_if: proc { |attributes| attributes['nota'].blank? },
                                :allow_destroy => true
  def category_text
    if self.category == 1
      return 'Civil'
    elsif self.category == 2
      return 'Trabalhista'
    end
  end

  def free_text
    if self.free == 1
      'Sim'
    else
      'Não'
    end
  end
end
