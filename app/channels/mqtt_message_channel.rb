class MqttMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "mqtt_message"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
