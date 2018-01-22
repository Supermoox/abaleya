json.extract! bus, :id, :transporter_id, :description, :created_at, :updated_at
json.url bus_url(bus, format: :json)
