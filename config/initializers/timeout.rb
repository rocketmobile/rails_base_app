# seconds until a request is aborted with
# a Timeout::Error exception raised
Rack::Timeout.timeout = begin
  timeout = ENV['RACK_TIMEOUT'].to_f if ENV['RACK_TIMEOUT'].present?
  timeout ||= (Rails.env.production? ? 10 : 1800)
  puts "=> Rack::Timeout set to #{timeout} in #{Rails.env}"
  timeout
end

# Rack::Timeout logs a line every time there's a change in state in a request's lifetime.
#   * Changes into `timed_out` and `expired` are logged at the ERROR level
#   * Most other events are logged as INFO
#   * `active state` is logged as DEBUG, every ~1s while the request is still active
#
# Change the timeout logger level to debug
# Rack::Timeout.logger.level = ::Logger::DEBUG