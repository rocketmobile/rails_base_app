require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'


# Start tracking code coverage metrics
# require 'coveralls'
# Coveralls.wear! 'rails'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'factory_girl'

  # Checks for pending migrations before tests are run.
  # If you are not using ActiveRecord, you can remove this line.
  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
end

Spork.each_run do
  # This code will be run each time you run your specs.

  # reloads supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  silence_warnings do
    puts "reloading support files"
    Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| load f}
  end

  # reload all the models between tests (rather than between requests with cache_classes=false)
  silence_warnings do
    puts "reloading models"
    Dir["#{Rails.root}/app/models/**/*.rb"].each{ |model| load model }
  end

  # reload all factory definitions
  puts "reloading factory girl"
  FactoryGirl.reload

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

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    c.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    c.infer_base_class_for_anonymous_controllers = false

    # Run specs in random order to surface order dependencies. If you find an
    # order dependency and want to debug it, you can fix the order by providing
    # the seed, which is printed after each run.
    #     --seed 1234
    c.order = "random"
  end
end
