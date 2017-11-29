App.message = App.cable.subscriptions.create "MqttMessageChannel",
  connected: ->
    console.log("Connected to mqtt message channel")

  disconnected: ->
    console.log("Disconnected to mqtt message channel")

  received: (data) ->
    console.log(data.device_message)

    dev_id = document.getElementById(data.device_message.device_name).getAttribute("class");
    

    if data.device_message.audio_level isnt undefined
      $('#'+dev_id+'_audio_time').load('/controls '+ '#'+dev_id+'_audio_time')
      document.getElementById(dev_id+'_audio').innerHTML = data.device_message.audio_level
      
    if data.device_message.temp_raw isnt undefined
      $('#'+dev_id+'_temperature_time').load('/controls '+ '#'+dev_id+'_temperature_time')
      document.getElementById(dev_id+'_temperature').innerHTML = data.device_message.temp_raw

    if data.device_message.luminosity isnt undefined
      $('#'+dev_id+'_luminosity_time').load('/controls '+ '#'+dev_id+'_luminosity_time')
      document.getElementById(dev_id+'_luminosity').innerHTML = data.device_message.luminosity

    if data.device_message.humidity isnt undefined
      $('#'+dev_id+'_humidity_time').load('/controls '+ '#'+dev_id+'_humidity_time')
      document.getElementById(dev_id+'_humidity').innerHTML = data.device_message.humidity
      