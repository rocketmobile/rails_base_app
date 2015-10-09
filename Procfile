web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -q high,2 -q default -e production -c 1