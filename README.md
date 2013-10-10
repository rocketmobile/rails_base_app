# Rocket Mobile: Base Rails Application

This base application is meant to give a common/recommended Rails app setup. It exhibits gem and convention choices that work and scale well togther. Based on experience, these conventions and gems can be used to achieve 90% of the features required of most web apps.

[![Build Status](https://secure.travis-ci.org/rocketmobile/rails_base_app.png)](http://travis-ci.org/rocketmobile/rails_base_app)
[![Coverage Status](https://coveralls.io/repos/rocketmobile/rails_base_app/badge.png)](https://coveralls.io/r/rocketmobile/rails_base_app)

## Cloning from this template
  * Fork the repo
  * Replace all instances of  'rails_base_app' with 'your-app-name' in project directory
  * Replace all instances of 'RailsBaseApp' with 'YourAppName' in project directory
  * Rename project directory to 'your-app-name'
  * If you're OCD, Replace the token in `config/initializers/secret_token.rb` with a token generated by running `SecureRandom.base64(128)`

  Now, reconfigure `.git/config` to point to your repo (so you don't try to push back to the rails_base_app repo), and you're good to go.

```text
  [remote "origin"]
    url = git@github.com:<your-user-or-organization-name>/<your-repo-name>
    fetch = +refs/heads/*:refs/remotes/origin/*
```

## Getting Started
  * A Pages controller exists for you in app/controllers/pages_controller
  * A dynamic home page exists for you in app/views/pages/home.haml
  * A dynamic layout exists for you in app/views/layouts/application.haml
  * Zurb Foundation 4 is set up as the styling framework

  * Run `rails s` and navigate to localhost:3000 to get started!

## Deploying
  This setup 'just works' on the Heroku PaaS stack.

```
heroku apps:create rails-base-app
git push heroku master
```

You can now run `heroku open` to visit [rails-base-app.herokuapp.com](http://rails-base-app.herokuapp.com) and get the root of the deployed application.

## Optimizations

### Production
  * Avoid server idling using New Relic Availability Monitoring
    * `heroku addons:add newrelic`
    * `heroku addons:open newrelic` to set up availability monitoring (Settings » Availability monitoring)
  * Host assets remotely using S3
    * Add `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_BUCKET` config variables
    * Make these variables available during precompile with `heroku labs:enable user_env_compile`
    * Deploy again by pushing new code to the heroku remote
  * Host assets with regional edge caches using CloudFront
    * Set up a CloudFront distribution with your S3 bucket as the origin
    * Add the `CDN_HOST` config variable with your distribution's domain name, without the protocol (ex: `d3fsl83hdxp1.cloudfront.net`)

### Development
  * Speed your tests using [Spork](https://github.com/sporkrb/spork)
    * In a first terminal window, `bundle exec spork` will start a Spork server
    * In a second terminal window, `rspec` will now run RSpec instantly without waiting for app initialization
    * You can still run `bundle exec rspec` without Spork for one-off tests

## Feature Examples
See the wiki for instructions for the following:
  * [How to send email](/wiki/How to send email)


## rails_base_app TODO
  * Comment out optional gems with descriptions
  * Create script to rename app with single command
  * Put JS OO architecture example in place
  * Make favicon.ico use asset pipeline
  * Dynamic 500 page
