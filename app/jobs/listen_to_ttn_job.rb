require 'mqtt'
require 'yaml'
require 'json'
require 'base64'

TTN_CONFIG = YAML.load_file("#{::Rails.root}/config/ttn.yml")
Rails.application.config.ttn = TTN_CONFIG

class ListenToTtnJob < ApplicationJob
  queue_as :default

  def perform(*args)
        ttn_client = MQTT::Client.connect(TTN_CONFIG['server'])
        ttn_client.get('+/devices/+/up') do |topic,message|
        puts "**********NEW TTN MESSAGE ****************"
        message = JSON.parse(message)
        mbed_info_db(message)
        ActionCable.server.broadcast "mqtt_message", device_message: message
      end
    
    end

    def mbed_info_db(message)
      device = Device.find_or_create_by(device_name: message["dev_id"]) if message["dev_id"]
      device.temperatures.create(:value =>  message["payload_fields"]["temperature_1"])  if  message["payload_fields"]["temperature_1"] 
      device.barometers.create(:value =>  message["payload_fields"]["barometric_pressure_2"])  if  message["payload_fields"]["barometric_pressure_2"]
      device.humidities.create(:value => message["payload_fields"]['relative_humidity_3'])  if message["payload_fields"]['relative_humidity_3']

    end
  end