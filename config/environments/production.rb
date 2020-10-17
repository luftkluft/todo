Rails.application.configure do
  config.require_master_key = true
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.active_storage.service = :local
  config.log_level = :debug
  config.log_tags = [:request_id]
  config.action_mailer.default_url_options = { host: 'https://todo-luftkluft.herokuapp.com/' }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    user_name: Rails.application.credentials.development[:mailtrap][:user_name],
    password: Rails.application.credentials.development[:mailtrap][:password],
    address: Rails.application.credentials.development[:mailtrap][:address],
    domain: Rails.application.credentials.development[:mailtrap][:domain],
    port: Rails.application.credentials.development[:mailtrap][:port],
    authentication: Rails.application.credentials.development[:mailtrap][:authentication]
  }
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
end
