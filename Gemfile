source 'https://rubygems.org'

ruby "1.9.3"
gem "rails",                    "~> 4.0.0"
gem "thin",                     "~> 1.5.0"

gem "asset_sync",               "~> 1.0.0"
gem "aws-sdk",                  "~> 1.14.1"
gem "dalli",                    "~> 2.6.4"
gem "devise",                   "~> 3.0.2"
gem "haml-rails",               github: "rocketmobile/haml-rails" #using our patch until templating changes are released
gem "has_scope",                "~> 0.5.1"
gem "hashie",                   "~> 2.0.5"
gem "honeybadger",              "~> 1.7.0"
gem "jquery-fileupload-rails",  "~> 0.4.1"
gem "jquery-ui-rails",          "~> 4.0.3"
gem "jquery-rails",             "~> 3.0.4"
gem "newrelic_rpm",             "~> 3.6"
gem "nokogiri",                 "~> 1.5.10" #aws-sdk depends on < 1.6
gem "paperclip",                "~> 3.5.0"
gem "pg",                       "~> 0.16.0"
gem "progressbar",              "~> 0.20.0"
gem "rack-rewrite",             "~> 1.3.3"
gem "rack-timeout",             github: "kch/rack-timeout", tag: 'v0.1.0beta3'
gem "squeel",                   github: "ernie/squeel", ref: '20501704e415caacb4a2b76bd6e39d93baba3188'
gem "will_paginate",            github: "mislav/will_paginate", ref: '0da168851b9356f678106abd19055fc6e9a6df72'

# Workers
gem "httparty",                 "~> 0.11.0"
gem "redis",                    "~> 3.0.4"
gem "sidekiq",                  "~> 2.13.0"
gem "sidekiq-failures",         "~> 0.2.1"
gem "slim",                     "~> 2.0.0"
gem "sinatra",                  ">= 1.3.0", require: nil

# Assets (rails 4 obsoleted :assets grouping)
gem "sass-rails",             "~> 4.0.0"
gem "coffee-rails",           "~> 4.0.0"
gem "jquery-ui-sass-rails",   "~> 4.0.3.0"
gem "modernizr-rails",        "~> 2.6.2.3"
gem "uglifier",               "~> 2.1.2"
gem "zurb-foundation",        "~> 4.3.1"

group :development do
  gem "awesome_print"
  gem "better_errors"
  gem "binding_of_caller"
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
  gem "spork"
end
