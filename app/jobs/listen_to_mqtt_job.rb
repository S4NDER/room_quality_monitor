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
            end
        end
        end
    end

  end