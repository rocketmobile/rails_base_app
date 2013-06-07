# Rocket Mobile: Base Rails Application

## Cloning
  * Fork the repo
  * Replace all instances of  'rails_base_app' with 'your-app-name' in project directory
  * Replace all instances of 'RailsBaseApp' with 'YourAppName' in project directory
  * Rename project directory to 'your-app-name'
  * Reconfigure `.git/config` to point to your repo (so you don't push back to the base app repo)

```text
  [remote "origin"]
    url = git@github.com:<your-user-or-organization-name>/<your-repo-name>
    fetch = +refs/heads/*:refs/remotes/origin/*
```

## Getting Started
  Install the `homebrew` package manager on your system (if you don't already have it):

`/usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"`

  * ensure `/usr/local/bin` is in your PATH before /bin (`echo $PATH`)
    * add `export PATH=~/bin:/usr/local/bin:$PATH` to your ~/.bash_profile, if it is not
  * `brew install imagemagick`
  * `brew install qt`
  * `bundle install`
  * `brew install postgresql` to install postgres
    * follow post-install output to run server on login and now
  * `createuser rails -s`
  * `rake db:setup`

##TODO

* Add sentry helpers
