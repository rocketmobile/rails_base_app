# Workers
#    The number of process forks
ENV['WEB_FORKS'] ||= '2'
workers Integer(ENV['WEB_FORKS'])

# Threads
#    The number of threads, per worker
ENV['WEB_THREADS_PER_FORK_MIN'] ||= '1'
ENV['WEB_THREADS_PER_FORK_MAX'] ||= '10'
ENV['DB_POOL_PER_FORK'] ||= ENV['WEB_THREADS_PER_FORK_MAX']
threads Integer(ENV['WEB_THREADS_PER_FORK_MIN']), Integer(ENV['WEB_THREADS_PER_FORK_MAX'])

# Preload
#     Preloading reduces the startup time of individual Puma workers
#     and enables the use of `on_worker_boot` calls to establish
#     separate Postgres connections per worker.
preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] ||
                Rails.application.config.database_configuration[Rails.env]
    # note: we don't enable reaping, as it likely has negative consequences
    # https://github.com/rails/rails/issues/9907
    config['pool'] = ENV['DB_POOL_PER_FORK']
    ActiveRecord::Base.establish_connection(config)
  end
end