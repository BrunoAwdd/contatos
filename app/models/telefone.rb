class Telefone < ActiveRecord::Base
  belongs_to :contato
  validates :tipo, :telefone, presence: true
end
