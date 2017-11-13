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
                puts "--------------------"
                puts cHash.inspect
            end
        end
        end
    end

    def mbed_info_db(message)
      Device.find_or_create_by(device_name: message['device_name'])
      
    end

  end