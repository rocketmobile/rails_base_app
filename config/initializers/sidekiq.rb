# Sidekiq.instance_eval do
#   def has_backend?
#     Sidekiq.redis{ |c| c.info.present? }
#   rescue
#     false
#   end
# end

# if Sidekiq.has_backend?
#   puts "=> Sidekiq backend detected, queueing Sidekiq jobs to run asyncronously"
# else
#   puts "=> No Sidekiq backend detected, running Sidekiq jobs inline"
#   require 'sidekiq/testing/inline'
# end

# if ENV['BASIC_AUTH_USER'].present?
#   Sidekiq::Web.use Rack::Auth::Basic do |u, p|
#     [u, p] == [ENV['BASIC_AUTH_USER'], ENV['BASIC_AUTH_PASSWORD'] || '']
#   end
# end

# The `poll_interval` dictates how often *each* server process
# checks to move a single scheduled job to a work queue
#
# Default: tuned to achieve an aggregate poll time
#          of ~15 seconds by *all* workers
#
# Aggregate poll = (poll_interval / 2) / number of server processes
#                   poll_interval is halved becuase a server calculates it's
#                   poll time by randomizing the poll interval (random sum ~= .5)
# This shows us that:
# Poll interval  = Server Processes * 2 * Desired Aggregate Poll
#
# Ex: If you want ensure scheduled jobs are checked approx every second
#     and you have 20 Sidekiq server processes, setting poll_interval to 1
#     would result in jobs being checked every (1/2) / 20 = .025 = 25ms!
#     Instead, 20 * 2 * 1sec = 40 seconds should be the interval in this example.
#
# desired_poll = 1
# worker_processes = 1

# Sidekiq.poll_interval = server_interval = worker_processes * 2 * desired_poll
# puts "=> Sidekiq poll interval set to #{server_interval}sec to achieve a system poll every #{desired_poll} sec"

# By default, Sidekiq assumes Redis is located at localhost:6379
# It will also use ENV vars configured in the following way:
# RedisToGo can be used with the REDISTOGO_URL env var directly.
# All others can use the REDIS_PROVIDER env var.
#
##  Ex: REDIS_PROVIDER=REDISGREEN_URL will configure Sidekiq to use
##  the REDISGREEN_URL value for it's redis connection.
#
# Finally, the generic REDIS_URL var may be used.
#
# Note that heroku (addon) redis providers create/use these ENV vars by default.

# To configure to a Redis server (sidekiq processes)
# and client (application processes) manually
#
# Sidekiq.configure_server do |config|
#   config.redis = { :url => 'redis://redis.example.com:7372/12', :namespace => 'mynamespace' }
# end
#
# When using a forked server like Unicorn, the client needs to be configured
# for each fork, using the server's `after_fork` callback:
# https://github.com/mperham/sidekiq/wiki/Connecting-to-Redis
#
# Sidekiq.configure_client do |config|
#   config.redis = { :size => 1 }
# end