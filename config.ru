# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Proc.new {[200,{'Content-Type' => 'text/plain'}, ["hello world"]]}

run Rails.application
Rails.application.load_server


