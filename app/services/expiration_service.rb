class ExpirationService
  def initialize
    @expiredDocs = 0
  end

  def live
    'i am live'
  end

  def expiredDocuments
    expireds = Array.new
    @documents = Credit::Client::Document.all
    @documents.each do |document|
      if (document.expired?)
        @url = Rails.application.routes.url_helpers.url_for controller: '/credit/client/generals', action: 'show', id: 1, only_path: true
        message = "A documentação do cliente <a href='#{@url}'> #{document.credit_client_general.brand} </a>, esta desatualizada. Os Arquivos "
        @message = Usuario::Message.new(:message => message, :status => 0, :from_id => 3)
        @message.save
        expireds.push(@message )
      end
    end
    return expireds
  end

  def expiredDocs
    @clients = Credit::Client::General.all
    @clients.each do |client|
      @url = Rails.application.routes.url_helpers.url_for controller: '/credit/client/generals', action: 'show', id: client.id, only_path: true
      subject = "A documentação do cliente <a href='#{@url}'> #{client.brand}</a>, esta desatualizada."
      message =  subject + '<br><ul>'
      client.documents.each do |document|
        if (document.expired?)
          @expiredDocs += 1
          message += "<li>#{document.credit_document.name} esta expirado a #{document.expiredDays} dias </li>"
        end
      end
      message += "</ul>"
      createMessage(message, subject)
    end
  end

  private

    def createMessage (message, short_message = nil)
      if (@expiredDocs > 0)
          @message = Usuario::Message.new(:message => message, :status => 0, :from_id => 3, :subject => short_message)
          @message.save
      end
    end



end