# Rocket Mobile: Base Rails Application

## Cloning
  * Fork the repo
  * Replace 'rails_base_app' with 'your-app-name' in project directory
  * Replace 'RailsBaseApp' with 'YourAppName' in project directory
  * Rename project directory to 'your-app-name'

## Getting Started
  Install the `homebrew` package manager on your system (if you don't already have it):

`/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"`

  * ensure `/usr/local/bin` is in your PATH before /bin (`echo $PATH`)
    * add `export PATH=~/bin:/usr/local/bin:$PATH` to your ~/.bash_profile, if it is not
  * `brew install imagemagick`
  * `bundle install`
  * `brew install postgresql` to install postgres
    * follow post-install output to run server on login and now
  *  `createuser rails -s`
  * `rake db:setup`

## Testing

We use the `capybara-webkit` extension to enhance our JavaScript testing; this component depends on QT, which sadly isn't distributed in gem form. To install this dependency, run `brew install qt`.

Failed tests will dump the html and a screenshot of the rendered page, at the time of a failure, to /tmp/capybara. To debug certain failures, you can also utilize the `screenshot_and_open_image` helper.

##TODO

* Add sentry helpers