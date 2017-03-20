json.array!(@juridico_andamentos) do |juridico_andamento|
  json.extract! juridico_andamento, :id, :nota, :data, :processo_id
  json.url juridico_andamento_url(juridico_andamento, format: :json)
end
