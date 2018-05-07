json.array!(@products) do |product|
  json.extract! product, :id, :nome
  json.url product_url(product, format: :json)
end
