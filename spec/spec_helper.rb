require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'factory_girl'

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

  if !ENV['DRB']
    # Spork not running, calculate test coverage
    require 'coveralls'
    Coveralls.wear! 'rails'
  end

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
  end

  # Checks for pending migrations before tests are run.
  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

  # Increase log level to speed tests
  Rails.logger.level = 3
end

Spork.each_run do
  if ENV['DRB']
    # Spork is running,
    # calculate coverage locally
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  # reloads supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  silence_warnings do
    puts "Configuring: reloading support files"
    Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| load f}
  end

  # reload all the models between test runs
  # rather than between requests using `cache_classes=false`
  silence_warnings do
    puts "Configuring: reloading models"
    Dir["#{Rails.root}/app/models/**/*.rb"].each{ |model| load model }
  end

  # reload all factory definitions
  puts "Configuring: reloading factories"
  FactoryGirl.reload

  # ensure transactional rollback works with out of process `webkit-capybara`
  # note: required if using capybara-webkit with transactional fixtures
  # ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

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

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    c.use_transactional_fixtures = true
  end

end
