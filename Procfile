web: bundle exec rails server thin -p $PORT -e $RACK_ENV
worker: bundle exec sidekiq -q high,2 -q default -e production -c 1