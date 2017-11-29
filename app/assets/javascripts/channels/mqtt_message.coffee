App.message = App.cable.subscriptions.create "MqttMessageChannel",
  connected: ->
    console.log("Connected to mqtt message channel")

  disconnected: ->
    console.log("Disconnected to mqtt message channel")

  received: (data) ->
    console.log(data.device_message)
    #$('#devices').load('/controls #devices')

    console.log(data.device_message.device_name)
    #reg = "simulator_(\d+)"
    dev_id = data.device_message.device_name.match(/(\d+)/g)

    #document.getElementById(dev_id+'_audio').innerHTML = 'Audio: '+data.device_message.audio_level+' dB'
    #document.getElementById(dev_id+'_temperature').innerHTML = 'Temperature: '+data.device_message.temp_raw+' °C'
    #document.getElementById(dev_id+'_luminosity').innerHTML = 'Luminosity: '+data.device_message.luminosity +' lux'
    #document.getElementById(dev_id+'_humidity').innerHTML = 'Humidity: '+data.device_message.humidity + ' %'

    if data.device_message.audio_level isnt undefined
      console.log ('not undef audio')
      document.getElementById(dev_id+'_audio').innerHTML = data.device_message.audio_level
      $('#'+dev_id+'_audio_time').load('/controls '+ '#'+dev_id+'_audio_time')

    if data.device_message.temp_raw isnt undefined
      console.log ('not undef temp')
      document.getElementById(dev_id+'_temperature').innerHTML = data.device_message.temp_raw
      $('#'+dev_id+'_temperature_time').load('/controls '+ '#'+dev_id+'_temperature_time')
      

    if data.device_message.luminosity isnt undefined
      console.log ('not undef lum')
      document.getElementById(dev_id+'_luminosity').innerHTML = data.device_message.luminosity
      $('#'+dev_id+'_luminosity_time').load('/controls '+ '#'+dev_id+'_luminosity_time')


    if data.device_message.humidity isnt undefined
      console.log ('not undef humid')
      document.getElementById(dev_id+'_humidity').innerHTML = data.device_message.humidity
      $('#'+dev_id+'_humidity_time').load('/controls '+ '#'+dev_id+'_humidity_time')

