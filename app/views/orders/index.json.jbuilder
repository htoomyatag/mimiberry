json.array!(@orders) do |order|
  json.extract! order, :id, :customer_name, :nrc, :contact_phone, :shipping_address
  json.url order_url(order, format: :json)
end
