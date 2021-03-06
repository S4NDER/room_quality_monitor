App.message = App.cable.subscriptions.create "MqttMessageChannel",
  connected: ->
    console.log("Connected to mqtt message channel")

  disconnected: ->
    console.log("Disconnected to mqtt message channel")

  received: (data) ->
    console.log(data.device_message)

    if document.getElementById(data.device_message.device_name) isnt null or undefined
      dev_id = document.getElementById(data.device_message.device_name).getAttribute("class");

      $('#'+dev_id+'_audio').load('/controls '+ '#'+dev_id+'_audio')
      $('#'+dev_id+'_temperature').load('/controls '+ '#'+dev_id+'_temperature')
      $('#'+dev_id+'_luminosity').load('/controls '+ '#'+dev_id+'_luminosity')
      $('#'+dev_id+'_humidity').load('/controls '+ '#'+dev_id+'_humidity')
      $('#'+dev_id+'_barometer').load('/controls '+ '#'+dev_id+'_barometer')
    else if document.getElementById(data.device_message.dev_id) isnt null or undefined
      dev_id = document.getElementById(data.device_message.dev_id).getAttribute("class");

      $('#'+dev_id+'_audio').load('/controls '+ '#'+dev_id+'_audio')
      $('#'+dev_id+'_temperature').load('/controls '+ '#'+dev_id+'_temperature')
      $('#'+dev_id+'_luminosity').load('/controls '+ '#'+dev_id+'_luminosity')
      $('#'+dev_id+'_humidity').load('/controls '+ '#'+dev_id+'_humidity')
      $('#'+dev_id+'_barometer').load('/controls '+ '#'+dev_id+'_barometer')
    else
      location.reload()