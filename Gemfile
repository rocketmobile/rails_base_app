source 'https://rubygems.org'

ruby "1.9.3"
gem "rails",                    "~> 4.0.2"

# web server
gem "thin",                     "~> 1.6.1"

# middleware
gem "rack-rewrite",             "~> 1.4"
gem "rack-timeout",             github: "kch/rack-timeout",
                                tag: 'v0.1.0beta3'
# asset management
gem "asset_sync",               "~> 1.0.0"
gem "aws-sdk",                  "~> 1.30.0"
gem "delayed_paperclip",        "~> 2.6.1"                        # asyncronous image processing
gem "foundation-rails",         "~> 5.0.2"
gem "jquery-ui-sass-rails",     "~> 4.0.3.0"
gem "paperclip",                "~> 3.5.0"                        # easy object attachment with s3 storage
gem "sass-rails",               "~> 4.0.0"
gem "s3_direct_upload",         "~> 0.1.6"                        # buffer uploading from slow-clients
gem "uglifier",                 "~> 2.1.2"
gem "unf",                      "~> 0.1.3"

# cacheing, templateing, javascripts
gem "dalli",                    "~> 2.6.4"
gem "haml-rails",               "~> 0.5.2"
gem "jquery-fileupload-rails",  "~> 0.4.1"
gem "jquery-ui-rails",          "~> 4.0.3"
gem "jquery-rails",             "~> 3.0.4"
gem "modernizr-rails",          "~> 2.6.2.3"

# modeling
gem "devise",                   "~> 3.2.2"
gem "devise-async",             "~> 0.9.0"
gem "has_scope",                "~> 0.5.1"
gem "hashie",                   "~> 2.0.5"
gem "squeel",                   github: "activerecord-hackery/squeel",
                                ref: 'd3712220'
gem "will_paginate",            "~> 3.0.5"

# operations
gem "honeybadger",              "~> 1.10"
gem "newrelic_rpm",             "~> 3.7"
gem "pg",                       "~> 0.17"

# # Workers
# # Process long jobs asyncronously from requests.
# gem "httparty",                 "~> 0.12"
# gem "redis",                    "~> 3.0"
# gem "sidekiq",                  "~> 2.17"
# gem "sidekiq-failures",         "~> 0.2"
# gem "slim",                     "~> 2.0"
# gem "sinatra",                  ">= 1.4", require: nil

group :development do
  gem "awesome_print"
  gem "better_errors"
  gem "mailcatcher"
  gem "quiet_assets"
  gem "sqlite3"
  gem "travis"
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

  # # If app has significant JS functionality,
  # # use capybara-webkit to test headlessly
  # gem "capybara-screenshot"
  # gem "capybara-webkit",      "~> 1.1.0"
end
