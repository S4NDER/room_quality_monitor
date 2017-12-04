App.message = App.cable.subscriptions.create "MqttMessageChannel",
  connected: ->
    console.log("Connected to mqtt message channel")

  disconnected: ->
    console.log("Disconnected to mqtt message channel")

  received: (data) ->
    console.log(data.device_message)

    if document.getElementById(data.device_message.dev) isnt null or undefined
      dev_id = document.getElementById(data.device_message.dev).getAttribute("class");

      $('#'+dev_id+'_audio').load('/controls '+ '#'+dev_id+'_audio')
      $('#'+dev_id+'_temperature').load('/controls '+ '#'+dev_id+'_temperature')
      $('#'+dev_id+'_luminosity').load('/controls '+ '#'+dev_id+'_luminosity')
      $('#'+dev_id+'_humidity').load('/controls '+ '#'+dev_id+'_humidity')
    else
      if document.getElementById('devices') isnt null or undefined
        $('.s12').append('<div class="col s6">
        <div class="z-depth-4">
        <div class="card-panel teal">
        <span class="white-text">
        <h5><b id="<%=device.device_name %>" class="<%=device.id%>"><%=device.device_name %></b></h5></br>
        <a class="edit_data btn orange show_chart modal-trigger" data-device-id="<%=device.id %>" data-device-type="audio" href="#modal1"><i class="material-icons ">show_chart</i></a>
        <span class="devicedata" id="<%=device.id %>_audio">
        <span class="data-type-title">Audio:</span>
        <span class="data-type-value"><%=device.audios.last&.value %></span>
        <span class="data-type-unit">db</span>
        <span class="data-type-time">(<%=((device.audios.last&.created_at)).try(:strftime, "%H:%M:%S")%>)</span>
        </span>
        </br>

        <a class="edit_data btn orange show_chart modal-trigger" data-device-id="<%=device.id %>" data-device-type="temperature" href="#modal1"><i class="material-icons ">show_chart</i></a>
        <span class="devicedata" id="<%=device.id %>_temperature">
        <span class="data-type-title">Temperature:</span>
        <span class="data-type-value"><%=device.temperatures.last&.value %></span>
        <span class="data-type-unit">°C</span>
        <span class="data-type-time">(<%=((device.temperatures.last&.created_at)).try(:strftime, "%H:%M:%S")%>)</span>
        </span>
        </br>

        <a class="edit_data btn orange show_chart modal-trigger" data-device-id="<%=device.id %>" data-device-type="luminosity" href="#modal1"><i class="material-icons ">show_chart</i></a>
        <span class="devicedata" id="<%=device.id %>_luminosity">
        <span class="data-type-title">Luminosity:</span>
        <span class="data-type-value"><%=device.luminosities.last&.value %></span>
        <span class="data-type-unit">lux</span>
        <span class="data-type-time">(<%=((device.luminosities.last&.created_at)).try(:strftime, "%H:%M:%S")%>)</span>
        </span>
        </br>

        <a class="edit_data btn orange show_chart modal-trigger" data-device-id="<%=device.id %>" data-device-type="humidity" href="#modal1"><i class="material-icons ">show_chart</i></a>
        <span class="devicedata" id="<%=device.id %>_humidity">
        <span class="data-type-title">Humidity:</span>
        <span class="data-type-value"><%=device.humidities.last&.value %></span>
        <span class="data-type-unit">%</span>
        <span class="data-type-time">(<%=((device.humidities.last&.created_at)).try(:strftime, "%H:%M:%S")%>)</span>
        </span>
        </span>
        </div>
        </div>
        </div>');
