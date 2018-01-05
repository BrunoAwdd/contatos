json.array!(@contatos) do |contato|
  json.extract! contato, :id, :first_name, :last_name, :full_name, :home_fone, :business_fone, :mobile_fone, :home_city, :home_state, :home_country, :notes, :web_page, :emails, :telefones, :business_generals
  json.url contato_url(contato, format: :json)
end
