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

  smtp_server = {address: 'localhost', port: 1025}
  begin
    require 'net/smtp'
    Net::SMTP.start(smtp_server[:address], smtp_server[:port]).finish
    # Mailcatcher running - use to intercept SMTP messages on :1025
    # viewable at localhost:1080
    config.action_mailer.smtp_settings = smtp_server
    config.action_mailer.delivery_method = :smtp
  rescue
    # Mailcatcher not running, accumulate emails in the
    # ActionMailer::Base.deliveries array.
    config.action_mailer.delivery_method = :test
  end

  # Use www for subdomain replacement logic in any mailers
  config.action_mailer.default_url_options = { host: 'www.lvh.me', port: '3000' }
  config.action_mailer.asset_host = 'http://lvh.me:3000'

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Expands the lines which load the assets
  config.assets.debug = true

  # Inject scripts in responses to connect to an optional guard process
  # which will result in page reloads automatically upon view/markup changes
  config.middleware.insert_before ::Rack::Runtime, Rack::LiveReload

  # Disable timeout logging
  Rack::Timeout.unregister_state_change_observer(:logger)

  # Configure generators values for scaffolding, etc
  config.generators do |g|
    g.stylesheets   false
    g.helper        false
    g.view_specs    false
    g.helper_specs  false
    g.request_specs false
    g.routing_specs false
  end
end
