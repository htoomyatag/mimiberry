json.array!(@cloths) do |cloth|
  json.extract! cloth, :id, :price, :item_code, :item_name
  json.url cloth_url(cloth, format: :json)
end
