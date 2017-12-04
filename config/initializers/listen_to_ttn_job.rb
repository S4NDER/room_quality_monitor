Rails.application.config.after_initialize do
    ListenToTtnJob.perform_later
end