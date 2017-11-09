require 'mqtt'
require 'json'

$min_luminosity = 0
$max_luminosity = 1000

$min_dB = 20
$max_dB = 110

$min_humidity = 0
$max_humidiy = 10

$min_temp = 5
$max_temp = 45

$send_interval = 10     #Time to wait between sending data

$float_accuracy = 2
$float_factor_min = 1.1
$float_factor_max = 1.5

class Sensor_Simulator

    attr_accessor :hash

    def send_to_mqtt
        sensor_topic = 'IoTdevices/RoomMonitor'
        client = MQTT::Client.connect('mqtt.labict.be')
        get_random_hash_for_json
        payload = JSON.generate(@hash)
        puts "#{payload}"
        puts "\n"
        client.publish('IoTdevices/RoomMonitor', payload, retain=false)
    end

    def run_simulator
        while true
            send_to_mqtt
            wait_x_seconds
        end
    end

    def get_random_dB
        return (rand($min_dB..$max_dB)/rand($float_factor_min..$float_factor_max)).round($float_accuracy)
    end

    def get_random_temperature
        return (rand($min_temp..$max_temp)/rand($float_factor_min..$float_factor_max)).round($float_accuracy)
    end

    def get_random_luminosity
        return (rand($min_luminosity..$max_luminosity)/rand($float_factor_min..$float_factor_max)).round($float_accuracy)
    end

    def get_random_humidity
        return (rand($min_humidity..$max_humidiy)/rand($float_factor_min..$float_factor_max)).round($float_accuracy)
    end

    def wait_x_seconds
        sleep $send_interval
    end

    def get_random_hash_for_json
        random_hash = rand(0..15)
        puts "possible json n° #{random_hash}"
        case random_hash
        when 0
            @hash = {
                    "audio_level" => get_random_dB,
                    "device_name" => "simulator"
                }
        when 1
            @hash = {
                    "temp_raw"  => get_random_temperature,
                    "device_name" => "simulator"
                }
        when 2
            @hash = {
                    "humidity"  => get_random_humidity,
                    "device_name" => "simulator"
                }
        when 3
            @hash = {
                    "luminosity"  => get_random_luminosity,
                    "device_name" => "simulator"
                }
        when 4
            @hash = {
                    "audio_level" => get_random_dB,
                    "temp_raw"  => get_random_temperature,
                    "device_name" => "simulator"
                }
        when 5
            @hash = {
                    "audio_level" => get_random_dB,
                    "humidity"  => get_random_humidity,
                    "device_name" => "simulator"
                }
        when 6
            @hash = {
                    "audio_level" => get_random_dB,
                    "luminosity"  => get_random_luminosity,
                    "device_name" => "simulator"
                }
        when 7
            @hash = {
                    "temp_raw"  => get_random_temperature,
                    "humidity"  => get_random_humidity,
                    "device_name" => "simulator"
                }
        when 8
            @hash = {
                    "temp_raw"  => get_random_temperature,
                    "luminosity"  => get_random_luminosity,
                    "device_name" => "simulator"
                }
        when 9
            @hash = {
                    "humidity"  => get_random_humidity,
                    "luminosity"  => get_random_luminosity,
                    "device_name" => "simulator"
                }
        when 10
            @hash = {
                    "audio_level" => get_random_dB,
                    "humidity"  => get_random_humidity,
                    "device_name" => "simulator"
                }
        when 11
            @hash = {
                    "audio_level" => get_random_dB,
                    "temp_raw"  => get_random_temperature,
                    "humidity"  => get_random_humidity,
                    "device_name" => "simulator"
                }
        when 12
            @hash = {
                    "audio_level" => get_random_dB,
                    "temp_raw"  => get_random_temperature,
                    "luminosity"  => get_random_luminosity,
                    "device_name" => "simulator"
                }
        when 13
            @hash = {
                    "audio_level" => get_random_dB,
                    "humidity"  => get_random_humidity,
                    "luminosity"  => get_random_luminosity,
                    "device_name" => "simulator"
                }
        when 14
            @hash = {
                    "temp_raw"  => get_random_temperature,
                    "humidity"  => get_random_humidity,
                    "luminosity"  => get_random_luminosity,
                    "device_name" => "simulator"
                }
        when 15
            @hash = {
                    "audio_level" => get_random_dB,
                    "temp_raw"  => get_random_temperature,
                    "humidity"  => get_random_humidity,
                    "luminosity"  => get_random_luminosity,
                    "device_name" => "simulator"
                }
        end
    end
end
puts "Sensor topic: 'IoTdevices/RoomMonitor'"
puts "MQTT service: 'mqtt.labict.be'"
sensor_simulator = Sensor_Simulator.new
sensor_simulator.run_simulator
