<<<<<<< HEAD
json.extract! device, :id, :device_name, :temp, :audio, :humidity, :luminosity, :created_at, :updated_at
=======
json.extract! device, :id, :audio_id, :humidity_id, :luminosity_id, :temperature_id, :created_at, :updated_at
>>>>>>> ddea7d137107c64b126df3195f9f214696888600
json.url device_url(device, format: :json)
