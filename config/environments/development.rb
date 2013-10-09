RailsBaseApp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.eager_load = false

  # Show full error reports and disable or enable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Mail: use mailcatcher in development to send/catch SMTP messages on :1025
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Expands the lines which load the assets
  config.assets.debug = true

  # Disable timeout logging
  Rack::Timeout.unregister_state_change_observer(:logger)

  # Enable auto evalution of unrecognized commands
  # We explicitly enable this for easier debugging in the console (using `rails console --debug`)
  # Default for this property is true for `Rails s --debug`, but false for `rails console --debug`
  Debugger.settings[:autoeval] = true
end
