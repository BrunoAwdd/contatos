class Telefone < ActiveRecord::Base
  belongs_to :contato
  validates :tipo, :telefone, presence: true

  def full_telefone
    telefone_final = ''

    ddd.blank? ? '' :  telefone_final += "(#{ddd}) "
    telefone.blank? ? '' : telefone_final += telefone
    tipo.blank? ? '' : telefone_final += " (#{tipo}) "

    telefone_final
  end
end
