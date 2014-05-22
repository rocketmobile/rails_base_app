# Documenation: https://github.com/guard/guard#readme

# Stylesheets
guard 'sass', :input => 'sass', :output => 'css'

guard 'livereload' do
  # Routes
  watch(%r{config/routes.rb})
  # Views
  watch(%r{app/views/.+\.(erb|haml|slim|rabl)$})
  # Presenters
  watch(%r{app/presenters/.+\.(rb)$})
  # View Helpers
  watch(%r{app/helpers/.+\.rb})
  # Public files
  watch(%r{public/.+\.(css|js|html)})
  # Tr8n strings
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|sass|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end

guard :bundler do
  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  # watch(/^.+\.gemspec/)
end

guard 'migrate' do
  watch(%r{^db/migrate/(\d+).+\.rb})
end

