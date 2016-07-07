json.array!(@emails) do |email|
  json.extract! email, :id, :email, :contato_id
  json.url email_url(email, format: :json)
end
