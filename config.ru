# This file is used by Rack-based servers to start the application.

# gzip rack responses
use Rack::Deflater

require ::File.expand_path('../config/environment',  __FILE__)
run RailsBaseApp::Application
