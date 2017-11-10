Rails.application.config.after_initialize do
    ListenToMqttJob.perform_later
end