# Rocket Mobile: Base Rails Application
[![Build Status](https://secure.travis-ci.org/rocketmobile/rails_base_app.png?branch=master)](https://travis-ci.org/rocketmobile/rails_base_app/branches)
[![Coverage Status](https://coveralls.io/repos/rocketmobile/rails_base_app/badge.png)](https://coveralls.io/r/rocketmobile/rails_base_app)

The base app is meant to give a common/recommended Rails app base configuration by:

* Exhibiting gem choices and patterns that work and scale well togther
* Providing a real-world starting place based on experience
* Giving guidance as app features grow:
  * Breadcrumbs via comments in the code base
  * Detailed guides in the [wiki](https://github.com/rocketmobile/rails_base_app/wiki)
  * Feature [branches](https://github.com/rocketmobile/rails_base_app/branches)

## Getting started with the base app
  * Clone the repo with `git clone git@github.com:rocketmobile/rails_base_app your-app-name`
  * Replace all instances of  'rails_base_app' with 'your-app-name' in project directory
  * Replace all instances of 'RailsBaseApp' with 'YourAppName' in project directory
  * Reconfigure `.git/config` to point to your repo (so you don't try to push back to the rails_base_app repo).

```text
  [remote "origin"]
    url = git@github.com:<your-user-or-organization-name>/<your-repo-name>
    fetch = +refs/heads/*:refs/remotes/origin/*
```

## Using the base app

  * A Pages controller exists for you in app/controllers/pages_controller
  * A dynamic home page exists for you in app/views/pages/home.haml
  * A dynamic layout exists for you in app/views/layouts/application.haml
  * Zurb Foundation 5 is set up as the styling framework

  * Run `rails s` and navigate to [localhost:3000](http://lvh.me:3000) to get started

### Deploying
  This setup 'just works' on the Heroku PaaS stack.

```
heroku apps:create rails-base-app
git push heroku master
```

You can now run `heroku open` to visit [rails-base-app.herokuapp.com](http://rails-base-app.herokuapp.com) and get the root of the deployed application.

### Optimizations

#### Production
  * Secure signed assets with a unique encryption key
    * run `` heroku config:add SECRET_KEY_BASE=`rake secret` ``
  * Avoid server idling using New Relic Availability Monitoring
    * `heroku addons:add newrelic`
    * `heroku addons:open newrelic` to set up availability monitoring (Settings » Availability monitoring)
  * Host assets remotely using S3 and `asset_sync`
    * Add `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_BUCKET` config variables
    * Make these variables available during precompile with `heroku labs:enable user-env-compile`
    * Generate initial assets by executing `heroku run rake assets:precompile`
  * Host assets with regional edge caches using CloudFront
    * Set up a CloudFront distribution with your S3 bucket as the origin
    * Add the `CDN_HOST` config variable with your distribution's domain name, without the protocol (ex: `d3fsl83hdxp1.cloudfront.net`)
  * Put site behind basic authentication while under development or for staging
    * Add the `BASIC_AUTH_USER` and `BASIC_AUTH_PASSWORD` config variables
  * Analyze traffic with Google Analytics
    * Add the `GOOGLE_TRACKING_CODE` config variable, with [your tracking code](https://support.google.com/analytics/answer/1042508?topic=1006228)
  * Expire long-running requests
    * Set the `RACK_TIMEOUT` config variable to the number of seconds to allow a request to run before raising `Timeout::Error`
  * Continously deploy the 'golden' master branch
    * Run `travis setup heroku` to configure for automatic deploys after a passed test-suite
    * Add the `strategy: git` value to the `deploy` key in `.travis.yml` so `user-env-compile` works correctly
  * Use a [russian-doll cacheing pattern](http://blog.remarkablelabs.com/2012/12/russian-doll-caching-cache-digests-rails-4-countdown-to-2013)
    * Add a memcached client with `heroku addons:add memcachier`
    * Use simple, auto-expiring cache keys in your views (ex:`- cache model_object do <a bunch of haml that will generate many persistence-layer queries>`)


#### Development
  * Tests will run quickly using spring
    * A first call to `bin/rspec` will load spring binstub
    * Subsequent calls will not suffer the app startup penalty
  * View detailed test results and coverage in your browser
    * Open `/coverage/index.html` in a browser to see test coverage information
    * Open `/coverage/results.html` in a browser to see real-time test progress
  * Debug with the ease of [debugger](https://github.com/cldwalker/debugger) and the power of [pry](http://pryrepl.org/)
    * Make a call to `debugger` anywhere in the application
    * The running process (e.g. foreman, rails console, rails server, rspec, or even spring) will hault with a `pry` prompt
    * Evaluate any ruby or execute any `pry` commands in the context of your `debugger` method
    * Type `c` and press enter to continue normal execution or your test/request/etc

## Feature Examples and Guides
Some feature examples exist on [branches](https://github.com/rocketmobile/rails_base_app/branches) that are rebased to the master branch.
These branches show a few commits showing how to implement a particular feature, without any other noise.
As a bonus, in theory (not always in practice), you can add a particular feature by merging in that branch.

```
git clone git@github.com:rocketmobile/rails_base_app
git merge registerable-users
rake db:migrate
rails s
```

Feature Guides exist on the [wiki](https://github.com/rocketmobile/rails_base_app/wiki) as well, with details and explanations around choices made. Ideally, these guides are complemented by a feature branch.

## Contributing
  * See or create [issues](https://github.com/rocketmobile/rails_base_app/issues)
  * Fork and create a branch for your changes
  * Tests are appreciated where pragmatic
  * Create a pull request with changes, take care about what branch your pull request targets
    * Master for a featureless application feature-specific branches for feature examples
