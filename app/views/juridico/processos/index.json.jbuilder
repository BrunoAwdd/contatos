json.array!(@juridico_processos) do |juridico_processo|
  json.extract! juridico_processo, :id, :number, :category, :author, :defendant, :date, :shire, :circuit, :value, :notes
  json.url juridico_processo_url(juridico_processo, format: :json)
end
