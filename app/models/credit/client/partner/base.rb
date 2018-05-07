class Credit::Client::Partner::Base < ApplicationRecord
  belongs_to :credit_client_general
  has_many :partner_documents, inverse_of: :partner_base, foreign_key: 'partner_base_id', dependent: :destroy,
           class_name:"Credit::Client::Partner::Document"
  accepts_nested_attributes_for :partner_documents, :allow_destroy => true, :reject_if => :all_blank

  belongs_to :contato, class_name: '::Contato', foreign_key: 'contato_id'
  accepts_nested_attributes_for :contato, :allow_destroy => true, :reject_if => :all_blank


  def documents_build
    if (self.partner_documents.any?)

      @idList = Array.new

      self.partner_documents.each do |item|
        @idList.push(Credit::Client::Partner::DocumentList.find(item.document_list_id).id)
      end

      Credit::Client::Partner::DocumentList.where.not(id: @idList ).each do |document|
        self.partner_documents.build([:document_list_id => document.id])
      end

    else

      Credit::Client::Partner::DocumentList.all.each do |document|
        documents_list = [:document_list_id => document.id]
        self.partner_documents.build(documents_list)
      end

    end
  end
end
