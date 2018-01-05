json.extract! usuario_message, :id, :date, :message, :status, :user_id, :created_at, :updated_at
json.url usuario_message_url(usuario_message, format: :json)
