require 'rubygems'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'factory_girl'

if ['CI'] == 'true'
  require 'coveralls'
  Coveralls.wear! 'rails'
end

# enable use of helpful `screenshot_and_open_image` helper (for integration testing)
#
# note: by default the rspec driver will be rack_test, which doesn't support rendering
#       if you need a screenshot, mark the spec as javascript (with `, js: true` on the example call)
#       to use the capybara-webkit driver which supports rendering
# important: enable `ActiveRecord::Base.shared_connection` logic below if using capybara-webkit
#
# require 'capybara-screenshot/rspec'
# Capybara.javascript_driver = :webkit
Capybara.javascript_driver = :slenium
Capybara.default_wait_time = 10
Capybara.server_port = 3121

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| load f}

RSpec.configure do |c|
  c.filter_run :only => true
  #when paired with an inclusion filter like ":focus => true", 'run_all_when_everything_filtered'
  #will run all examples when none match the inclusion filter
  #(i.e. 'it "does something else", :focus => true do')
  c.run_all_when_everything_filtered = true

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  c.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Easier calls to factories
  c.include FactoryGirl::Syntax::Methods

  # Allow user login by setting the session directly
  # in integration tests requiring auth, avoiding signing in via slow requests
  # Usage:
  #   login_as(user_object, scope: :user)
  c.include Warden::Test::Helpers
  Warden.test_mode!

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  c.infer_base_class_for_anonymous_controllers = false

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  c.use_transactional_fixtures = true

  # ensure transactional rollback works with out of process `webkit-capybara`
  # note: required if using capybara-webkit with transactional fixtures
  # ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
end

# Checks for pending migrations before tests are run.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

# Increase log level to speed tests
Rails.logger.level = 3

if defined?(Spring)
  Spring.after_fork do
    # running in CI env, calculate test coverage
    unless ['CI'] == 'true'
      # calculate coverage locally
      require 'simplecov'
      SimpleCov.start 'rails'
    end

    # reload all factory definitions
    puts "Configuring: reloading factories"
    FactoryGirl.reload

    RSpec.configure do |c|
      # Run specs in random order to surface order dependencies. If you find an
      # order dependency and want to debug it, you can fix the order by providing
      # the seed, which is printed after each run (`'Randomized with seed 60468'`).
      # `defined` is the default, which executes groups and examples in the
      # order they are defined in the spec files.
      #
      # c.order = "defined"
      # c.order = "rand:60468"
      c.order = "random:#{rand(100000)}"
    end
  end
else
  unless ['CI'] == 'true'
    # calculate coverage locally
    require 'simplecov'
    SimpleCov.start 'rails'
  end
end
