class ListenToMqttJob < ApplicationJob
  queue_as :default

    def perform(*args)
        rqm_topic = 'IoTdevices/RoomMonitor'
        MQTT::Client.connect('mqtt.labict.be') do |client|
          while true
            client.get(rqm_topic) do |topic,message|
                cJson = message
                cHash = JSON.parse(cJson)
                ActionCable.server.broadcast "mqtt_message", device_message: cHash
                mbed_info_db(cHash)
            end
        end
        end
    end

    def mbed_info_db(message)
      device = Device.find_or_create_by(device_name: message['dev'])
      device.audios.create(:value => message['audio'])  if message['audio']
      device.humidities.create(:value => message['hum'])  if message['hum']
      device.luminosities.create(:value => message['lum'])  if message['lum']
      device.temperatures.create(:value => message['temp'])  if message['temp']    
    end
  end