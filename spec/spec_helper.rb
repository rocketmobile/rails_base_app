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

  if !ENV['DRB']
    # Spork not running, calculate test coverage
    require 'coveralls'
    Coveralls.wear! 'rails'
  end

  # Checks for pending migrations before tests are run.
  # If you are not using ActiveRecord, you can remove this line.
  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
end

Spork.each_run do
  # This code will be run each time you run your specs.

  # reload all the models between test runs
  # rather than between requests using `cache_classes=false`
  silence_warnings do
    puts "Configuring: reloading models"
    Dir["#{Rails.root}/app/models/**/*.rb"].each{ |model| load model }
  end

  # reload all factory definitions
  puts "Configuring: reloading factories"
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
