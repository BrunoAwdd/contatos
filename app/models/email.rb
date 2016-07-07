class Email < ActiveRecord::Base
  belongs_to :contato
  validates :email, presence: true
end
