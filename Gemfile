require "rbconfig"
HOST_OS = RbConfig::CONFIG["host_os"]

source 'https://rubygems.org'

ruby "1.9.3"
gem "rails",                    "~> 3.2.12"

gem 'asset_sync',               "~> 0.5.3"
gem "aws-sdk",                  "~> 1.7.1"
gem "cache_digests",            "~> 0.2.0"
gem "cancan",                   "~> 1.6.8"
gem "compass-rails",            "~> 1.0.3"
gem "dalli",                    "~> 2.6.2"
# gem "devise",                   "~> 2.1.0"
# gem "devise-async",             "~> 0.5.1"
gem "haml-rails",               "~> 0.3.4"
gem "has_scope",                "~> 0.5.1"
gem "hashie",                   "~> 1.2.0"
gem "jquery-fileupload-rails",  "~> 0.4.0"
gem "jquery-rails",             "~> 2.1.2"
gem "newrelic_rpm",             "~> 3.5.7.59"
gem "paperclip",                "~> 3.3.1"
gem "pg",                       "~> 0.14.1"
gem "pg_search",                "~> 0.5.7"
gem "progressbar",              "~> 0.11.0"
gem "rack-jsonp-middleware",    "~> 0.0.7", require: "rack/jsonp"
gem "rack-rewrite",             "~> 1.3.3"
gem "rack-timeout",             "~> 0.0.3"
gem "redis",                    "~> 3.0.2"
gem "rolify",                   "~> 3.2.0"
gem "sentry-raven",             "~> 0.4.3"
gem 'sinatra',                  "~> 1.3.0", require: nil
gem "sidekiq",                  "~> 2.7.3"
gem "sidekiq-failures",         "~> 0.1.0"
gem "slim",                     "~> 1.3.6"
gem "squeel",                   "~> 1.0.15"
gem "thin",                     "~> 1.5.0"
gem "will_paginate",            "~> 3.0.3"
gem "httparty",                 "~> 0.10"



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "sass-rails",             "~> 3.2.3"
  gem "coffee-rails",           "~> 3.2.2"
  # gem "zurb-foundation",        "~> 3.0.9"
  gem "bootstrap-sass",         "~> 2.3.0.1"
  gem "uglifier",               "~> 1.3.0"
end

group :development do
  gem "better_errors"
  gem "mailcatcher",            "~> 0.5.10"
  gem "quiet_assets"
  gem "sextant"
  gem "sqlite3"
end

group :development, :test do
  gem "awesome_print"
  gem "capybara-webkit"
  gem "capybara-screenshot"
  gem "debugger"
  gem "email_spec",             ">= 1.2.1"
  gem "faker"
  gem "factory_girl_rails",     ">= 3.3.0"
  gem "guard",                  ">= 0.6.2"
  gem "guard-bundler",          ">= 0.1.3"
  gem "guard-rails",            ">= 0.0.3"
  gem "guard-rspec",            ">= 0.4.3"
  gem "rspec-rails",            ">= 2.10.1"
  gem "simplecov",              require: false
  gem "spork"
end
