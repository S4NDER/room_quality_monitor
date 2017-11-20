App.message = App.cable.subscriptions.create "MqttMessageChannel",
  connected: ->
    console.log("Connected to mqtt message channel")

  disconnected: ->
    console.log("Disconnected to mqtt message channel")

  received: (data) ->
    console.log(data.device_message)
    $('#devices').load('/controls #devices')

    console.log(data.device_message.device_name)
    #reg = "simulator_(\d+)"
    dev_id = data.device_message.device_name.match(/(\d+)/g)
    console.log(dev_id+"_audio")

    if data.device_message.audio_level !=null
      document.getElementById(dev_id+"_audio").innerHTML = "Audio: "+data.device_message.audio_level+" dB"

    if data.device_message.temp_raw != null
      document.getElementById(dev_id+"_temperature").innerHTML = "Temperature: "+data.device_message.temp_raw+" °C"

    if data.device_message.luminosity != null
      document.getElementById(dev_id+"_luminosity").innerHTML = "Luminosity: "+data.device_message.luminosity +" lux"

    if data.device_message.humidity !=null
      document.getElementById(dev_id+"_humidity").innerHTML = "Humidity: "+data.device_message.humidity + " %"
