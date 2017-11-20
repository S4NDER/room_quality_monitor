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
      console.log ('not undef')
      document.getElementById(dev_id+'_audio').innerHTML = 'Audio: '+data.device_message.audio_level+' dB'

    else if data.device_message.temp_raw isnt undefined
      document.getElementById(dev_id+'_temperature').innerHTML = 'Temperature: '+data.device_message.temp_raw+' °C'

    else if data.device_message.luminosity isnt undefined
      document.getElementById(dev_id+'_luminosity').innerHTML = 'Luminosity: '+data.device_message.luminosity +' lux'

    else if data.device_message.humidity isnt undefined
      document.getElementById(dev_id+'_humidity').innerHTML = 'Humidity: '+data.device_message.humidity + ' %'
