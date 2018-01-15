class Credit::Client::Warranty::Base < ApplicationRecord
  belongs_to :credit_client_general
  has_many :warranty_documents, inverse_of: :warranty_base, foreign_key: 'warranty_base_id', dependent: :destroy,
           class_name:"Credit::Client::Warranty::Document"
  accepts_nested_attributes_for :warranty_documents, :allow_destroy => true, :reject_if => :all_blank

  def documents_build
    self.name = 'Aqui'
    if (self.warranty_documents.any?)

      @idList = Array.new
      self.name = 'Cheio'

      self.warranty_documents.each do |item|
        @idList.push(Credit::Client::Warranty::DocumentList.find(item.document_list_id).id)
      end

      Credit::Client::Warranty::DocumentList.where.not(id: @idList ).each do |document|
        self.warranty_documents.build([:document_list_id => document.id])
      end

    else

      Credit::Client::Warranty::DocumentList.all.each do |document|
        self.name = 'Vazio'
        documents_list = [:document_list_id => document.id]
        self.warranty_documents.build(documents_list)
      end

    end
  end
end
