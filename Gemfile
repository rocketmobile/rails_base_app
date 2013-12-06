source 'https://rubygems.org'

ruby "1.9.3"
gem "rails",                    "~> 4.0.2"
gem "thin",                     "~> 1.5.0"

gem "asset_sync",               "~> 1.0.0"
gem "aws-sdk",                  "~> 1.14.1"
gem "dalli",                    "~> 2.6.4"
gem "devise",                   "~> 3.0.2"
gem "haml-rails",               github: "indirect/haml-rails"
gem "has_scope",                "~> 0.5.1"
gem "hashie",                   "~> 2.0.5"
gem "honeybadger",              "~> 1.7.0"
gem "jquery-fileupload-rails",  "~> 0.4.1"
gem "jquery-ui-rails",          "~> 4.0.3"
gem "jquery-rails",             "~> 3.0.4"
gem "newrelic_rpm",             "~> 3.6"
gem "nokogiri",                 "~> 1.5.10" #aws-sdk depends on < 1.6

gem "pg",                       "~> 0.16.0"
gem "rack-rewrite",             "~> 1.3.3"
gem "rack-timeout",             github: "kch/rack-timeout", tag: 'v0.1.0beta3'
gem "squeel",                   github: "ernie/squeel", ref: '20501704e415caacb4a2b76bd6e39d93baba3188'
gem "will_paginate",            github: "mislav/will_paginate", ref: '0da168851b9356f678106abd19055fc6e9a6df72'

# Images
# easy image attachment with s3 storage,
# asyncronous image processing
# and buffered from slow-client uploads
gem "paperclip",                "~> 3.5.0"
gem "delayed_paperclip",        "~> 2.6.1"
gem "s3_direct_upload",         "~> 0.1.6"

# # Workers
# # When you need to process longer running jobs asyncronously from requests
# # the following gems are quite useful
# gem "httparty",                 "~> 0.11.0"
# gem "redis",                    "~> 3.0.4"
# gem "sidekiq",                  "~> 2.13.0"
# gem "sidekiq-failures",         "~> 0.2.1"
# gem "slim",                     "~> 2.0.0"
# gem "sinatra",                  ">= 1.3.0", require: nil

# Assets (rails 4 obsoletes :assets grouping)
gem "sass-rails",             "~> 4.0.0"
gem "jquery-ui-sass-rails",   "~> 4.0.3.0"
gem "modernizr-rails",        "~> 2.6.2.3"
gem "uglifier",               "~> 2.1.2"
gem "foundation-rails",       "~> 5.0.2"

group :development do
  gem "awesome_print"
  gem "better_errors"
  gem "mailcatcher"
  gem "quiet_assets"
  gem "sqlite3"
end

group :development, :test do
  gem 'coveralls',              require: false
  gem "capybara",               ">= 2.1.0"
  gem "debugger"
  gem "email_spec",             ">= 1.2.1"
  gem "faker"
  gem "factory_girl_rails",     ">= 4.2.1"
  gem "fuubar"
  gem "guard",                  ">= 0.6.2"
  gem "guard-bundler",          ">= 0.1.3"
  gem "guard-rails",            ">= 0.0.3"
  gem "guard-rspec",            ">= 0.4.3"
  gem "rspec-rails",            ">= 2.14.0"
  gem "spork-rails",            "~> 4.0.0"
end
