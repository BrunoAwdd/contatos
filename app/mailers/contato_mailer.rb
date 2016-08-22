class ContatoMailer < ApplicationMailer
  default from: 'alternative@alternativefinance.com.br'
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
      :address        => 'mail.alternativefinance.com.br',
      :domain         => 'www.alternativefinance.com.br',
      :port           => 587,
      :user_name      => 'alternative@alternativefinance.com.br',
      :password       => 'NEL1503',
      :authentication => :plain,
      :ssl            => false,
      :enable_starttls_auto => false,
  }
  ActionMailer::Base.raise_delivery_errors = true

  def hello_email(contato, newsletter)
    @contato = contato
    @newsletter = newsletter
    @url = 'http://www.alternativefinance.com.br'
    @message_html = prepare_message(@newsletter.html_message, {@contato.class.to_s => @contato})
    logger.debug @message_html.inspect
    @message_text = prepare_message(@newsletter.text_message, {@contato.class.to_s => @contato})
    mail(to: @contato.emails[0].email, subject: @newsletter.subject)
  end

  def prepare_message(message, objects = {})
    classe = ''
    classe_index = ''
    split = ''
    variables = message.to_str.scan(/\{\{(.*?)\}\}/)
    variables.each do |variable|
      split = variable[0].split('.')
      split.each do |item|
        if (item == split[0])
          classe = objects[split[0]]
        else
          value = classe.send(item)
          message = message.gsub("{{#{variable[0]}}}", value.to_s)
        end
      end
    end
    message
  end
end
