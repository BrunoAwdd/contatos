class Product < ActiveRecord::Base
  has_and_belongs_to_many :contatos
  has_and_belongs_to_many :newsletters
  has_many :documents
end
