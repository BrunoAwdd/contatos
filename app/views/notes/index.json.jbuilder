json.array!(@notes) do |note|
  json.extract! note, :id, :observacao, :contato_id
  json.url note_url(note, format: :json)
end
