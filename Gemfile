source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails',                    '~> 4.0.4'

# web server
gem 'thin',                     '~> 1.6.1'

# middleware
gem 'rack-rewrite',             '~> 1.4'
gem 'rack-timeout',             github: 'kch/rack-timeout',
                                tag: 'v0.1.0beta3'

# views: asset generation, javascripts, stylesheets
gem 'asset_sync',               '~> 1.0.0'
gem 'aws-sdk',                  '~> 1.30.0'
gem 'foundation-rails',         '~> 5.2.1'
gem 'jquery-fileupload-rails',  '~> 0.4.1'
gem 'jquery-rails',             '~> 3.0.4'
gem 'jquery-ui-sass-rails',     '~> 4.0.3.0'
gem 'lodash-rails',             '~> 2.4.1'
gem 'modernizr-rails',          '~> 2.6.2.3'
gem 'sass-rails',               '~> 4.0.0'
gem 'uglifier',                 '~> 2.1.2'
gem 'unf',                      '~> 0.1.3'
gem 'selectivizr-rails',        '~> 1.1.2'
gem 'select2-rails',            '~> 3.5.3'

# views: cacheing, templateing, html generation
gem 'dalli',                    '~> 2.6.4'
gem 'haml-rails',               '~> 0.5.2'
gem 'rabl',                     '~> 0.9.3'
gem 'roadie',                   '~> 2.4.3'
gem 's3_direct_upload',         '~> 0.1.6'                        # buffer uploading from slow-clients
gem 'will_paginate-foundation', '~> 5.3.3'

# controllers
gem 'has_scope',                github: 'plataformatec/has_scope',
                                tag: 'v0.6.0.rc'
gem 'url_store',                '~> 0.3.5'
gem 'will_paginate',            '~> 3.0.5'

# modeling
gem 'delayed_paperclip',        '~> 2.6.1'                        # asyncronous image processing
gem 'devise',                   '~> 3.2.2'
gem 'hashie',                   '~> 2.0.5'
gem 'paperclip',                '~> 3.5.0'                        # easy object attachment with s3 storage
gem 'ruby-progressbar',         '~> 1.4.2'

# operations
gem 'factory_girl_rails',       '~> 4.3.0'
gem 'faker',                    '~> 1.3.0'
gem 'honeybadger',              '~> 1.10'
gem 'newrelic_rpm',             '~> 3.7'
gem 'pg',                       '~> 0.17'

# # Workers
# # Process long jobs asyncronously from the rails web process.
# # https://github.com/rocketmobile/rails_base_app/wiki/Process-long-running-jobs-asynchronously
# gem 'httparty',                 '~> 0.12'                      # make requests to slow clients in async workers
# gem 'sidekiq',                  '~> 2.17'
# gem 'sidekiq-failures',         '~> 0.3'
# gem 'sinatra',                  '~> 1.4.4'

group :development do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'guard',                  '>= 0.6.2'
  gem 'guard-bundler',          '>= 0.1.3'
  gem 'guard-livereload',       require: false
  gem 'guard-rails',            '>= 0.0.3'
  gem 'guard-sass',             require: false
  gem 'html2haml'
  gem 'mailcatcher'
  gem 'quiet_assets'
  gem 'rack-livereload'
  gem 'sqlite3'
  gem 'travis'
end

gem 'debugger', groups: [:development, :test]

group :development, :test do
  gem 'coveralls',              require: false
  gem 'capybara',               '>= 2.1.0'
  gem 'email_spec',             '>= 1.2.1'
  gem 'fuubar'
  gem 'guard-rspec',            '>= 0.4.3'
  gem 'rspec-rails',            '>= 2.14.0'
  gem 'spork-rails',            '~> 4.0.0'

  # # If app has significant JS functionality,
  # # use capybara-webkit to test headlessly
  # gem 'capybara-screenshot'
  # gem 'capybara-webkit',      '~> 1.1.0'
end
