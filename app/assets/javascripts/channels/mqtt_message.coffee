App.message = App.cable.subscriptions.create "MqttMessageChannel",
  connected: ->
    console.log("Connected to mqtt message channel")

  disconnected: ->
    console.log("Disconnected to mqtt message channel")

  received: (data) ->
    console.log(data.device_message)
    $('#devices').load('/controls #devices')

    console.log(data.device_message.device_name)

    dev_id = data.device_message.device_name 

    "simulator_(/d+)"
    
    document.getElementById(dev_id+"_audio").innerHTML = data.device_message.audio_level if !null
    document.getElementById(dev_id+"_temperature").innerHTML = data.device_message.temp_raw if !null
    document.getElementById(dev_id+"_luminosity").innerHTML = data.device_message.luminosity if !null
    document.getElementById(dev_id+"_humidity").innerHTML = data.device_message.humidity if !null
