json.extract! device, :id, :device_name, :temp, :audio, :humidity, :luminosity, :created_at, :updated_at
json.url device_url(device, format: :json)
