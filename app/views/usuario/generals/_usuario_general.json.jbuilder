json.extract! usuario_general, :id, :name, :last_name, :user_id, :created_at, :updated_at
json.url usuario_general_url(usuario_general, format: :json)