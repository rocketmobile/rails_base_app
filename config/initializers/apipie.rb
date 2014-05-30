Apipie.configure do |config|
  config.app_name = "RailsBaseApp"
  config.app_info = "This is an example api."
  config.copyright = ""
  config.api_base_url = "1"
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
  config.ignored_by_recorder = %w[]
  config.doc_base_url = "/"
  config.use_cache = Rails.env.production?
  config.validate = false
  config.force_dsl = true
  config.reload_controllers = Rails.env.development?
  config.default_version = "v1"
end
