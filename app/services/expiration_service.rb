class ExpirationService
  def initialize
    @expiredDocs = 0
  end

  def expiredDocs
    @clients = Credit::Client::General.all
    ms = ''
    @clients.each do |client|
      @url = Rails.application.routes.url_helpers.url_for controller: '/credit/client/generals', action: 'show', id: client.id, only_path: true
      subject = "A documentação do cliente <a href='#{@url}'> #{client.brand}</a>, esta desatualizada:"
      message =  subject + '<br><ul>'
      client.documents.each do |document|
        if (document.expired?)
          @expiredDocs += 1
          message += "<li>#{document.credit_document.name} esta expirado a #{document.expiredDays} dias; </li>"
        end
      end

      message += expired_docs_partners (client.partners)
      message += expired_docs_warranties (client.warranties)
      message += "</ul>"

      createMessage(message, subject)
      ms = message
    end
    ms
  end

  private

    def expired_docs_partners (partners)
      message = ''
      partners.each do |partner|
        if partner.contato.nil?
          contato_nome = '(Informações do Sócio Pendente)'
        else
          contato_nome = partner.contato.full_name
        end
        message += "<li><strong>Sócio: </strong>#{contato_nome}</li><ul>"
        partner.partner_documents.each do |document|
          if (document.expired?)
            @expiredDocs += 1
            message += "<li>#{document.document_list.name} esta expirado a #{document.expiredDays} dias;"
          end
        end
        message += '</ul>'
      end
      return message
    end

    def expired_docs_warranties (warranties)
      message = ''
      warranties.each do |warranty|
        message += "<li><strong>Garantia: </strong>#{warranty.name}</li><ul>"
        warranty.warranty_documents.each do |document|
          if document.expired?
            @expiredDocs += 1
            message += "<li>#{document.document_list.name} esta expirado a #{document.expiredDays} dias;"
          end
        end
        message += '</ul>'
      end
      return message
    end

    def createMessage (message, short_message = nil)
      if (@expiredDocs > 0)
        users = Usuario::General.all
        @message = Usuario::Message.new(:message => message, :status => 0, :from_id => 3, :subject => short_message)
        @message.save
        users.each do |user|
          user.messages_count =+1
          user.update
        end
      end
    end



end