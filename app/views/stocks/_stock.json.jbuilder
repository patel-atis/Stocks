json.extract! stock, :id, :company, :ticker, :price, :dividend, :type, :rating, :created_at, :updated_at
json.url stock_url(stock, format: :json)
