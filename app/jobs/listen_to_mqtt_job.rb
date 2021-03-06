class ListenToMqttJob < ApplicationJob
  queue_as :default

    def perform(*args)
      labict_client=MQTT::Client.connect('mqtt.labict.be')        
      labict_client.get("IoTdevices/RoomMonitor") do |topic,message|
            cJson = message
            cHash = JSON.parse(cJson)
            ActionCable.server.broadcast "mqtt_message", device_message: cHash
            mbed_info_db(cHash)
        end     
    end

    def mbed_info_db(message)
      device = Device.find_or_create_by(device_name: message['device_name']) if message['device_name']

      device.audios.create(:value => message['audio_level'])  if message['audio_level']
      device.humidities.create(:value => message['humidity'])  if message['humidity']
      device.luminosities.create(:value => message['luminosity'])  if message['luminosity']
      device.temperatures.create(:value => message['temp_raw'])  if message['temp_raw']      
    end
  end