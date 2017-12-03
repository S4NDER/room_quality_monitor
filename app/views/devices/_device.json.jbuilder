json.extract! device, :id, :device_name 

json.audios(device.audios) do |audio|
    json.value audio.value
    json.created_at audio.created_at
end

json.temperatures(device.temperatures) do |temperature|
    json.value temperature.value
    json.created_at temperature.created_at
end

json.luminosities(device.luminosities) do |luminosity|
    json.value luminosity.value
    json.created_at luminosity.created_at
end

json.humidities(device.humidities) do |humidity|
    json.value humidity.value
    json.created_at humidity.created_at
end

json.barometers(device.barometers) do |barometer|
    json.value barometer.value
    json.created_at barometer.created_at
end