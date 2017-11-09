json.extract! device, :id, :audio_id, :humidity_id, :luminosity_id, :temperature_id, :created_at, :updated_at
json.url device_url(device, format: :json)
