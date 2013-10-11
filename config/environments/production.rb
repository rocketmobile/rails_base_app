RailsBaseApp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  config.eager_load = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enable Rails's static asset server in case deployed to Heroku without using S3 or CDN
  config.serve_static_assets = true

  # Compress JavaScripts and CSS
  config.assets.js_compressor = :uglifier

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # set log level with config/env variables
  # production is set to :info by default
  config.log_level = ENV["LOG_LEVEL"].to_sym if ENV["LOG_LEVEL"].in?(%w(debug info warn error fatal))

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # The path will be used during asset compilation
  # Note: ENV VARS aren't available by default on heroku deployments at compilation time.
  #       run  `heroku labs:enable user-env-compile` to make them available for precompilation.
  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  config.action_controller.asset_host = "//#{ENV['CDN_HOST']}" if ENV['CDN_HOST']
  config.action_controller.asset_host ||= "//#{ENV['AWS_BUCKET']}.s3.amazonaws.com" if ENV['AWS_BUCKET'].present?

  config.action_mailer.asset_host = config.action_controller.asset_host

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  config.action_mailer.default_url_options = { :host => ENV["EMAIL_HOST"] || "example.com" }

  if ENV['SENDGRID_USERNAME'].present?
    ActionMailer::Base.smtp_settings = {
      :address        => 'smtp.sendgrid.net',
      :port           => '587',
      :authentication => :plain,
      :user_name      => ENV['SENDGRID_USERNAME'],
      :password       => ENV['SENDGRID_PASSWORD'],
      :domain         => 'heroku.com'
    }

    ActionMailer::Base.delivery_method = :smtp
  end

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Put whole application behind basic auth if ENV vars are set up
  # good while under construction or for staging deployments
  if ENV['BASIC_AUTH_USER'].present? && ENV['BASIC_AUTH_PASSWORD'].present?
    config.middleware.insert_after(Rails::Rack::Logger, "::Rack::Auth::Basic", "Authentication Required") do |u, p|
      [u, p] == [ENV['BASIC_AUTH_USER'], ENV['BASIC_AUTH_PASSWORD']]
    end
  end

  # Redirect to ensure all traffic flows through a single domain
  # Useful in certain DNS situations where SEO is important
  if ENV['FORCE_DOMAIN'].present?
    config.middleware.insert_after(Rails::Rack::Logger, Rack::Rewrite) do
      r301 %r{.*}, "http://#{ENV['FORCE_DOMAIN']}$&", :if => Proc.new { |rack_env| rack_env['SERVER_NAME'] != ENV['FORCE_DOMAIN'] }
    end
  end

end
