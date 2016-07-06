json.array!(@contatos) do |contato|
  json.extract! contato, :id, :first_name, :last_name, :display_name, :email, :email2, :home_fone, :business_fone, :mobile_fone, :home_city, :home_state, :home_country, :notes, :web_page
  json.url contato_url(contato, format: :json)
end
