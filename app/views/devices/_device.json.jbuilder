json.extract! device, :id, :device_name 

json.audios(device.audios) do |audio|
    json.value audio.value
    json.created_at audio.created_at
end