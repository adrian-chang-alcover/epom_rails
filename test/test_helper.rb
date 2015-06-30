# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require 'yaml'
env_file = File.join(Pathname.new(__FILE__).parent.parent, 'config', 'application.yml')
YAML.load(File.open(env_file)).each do |key, value|
  ENV[key.to_s] = value.to_s
end if File.exists?(env_file)

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../dummy/test/fixtures", __FILE__)
  ActiveSupport::TestCase.fixtures :all
end

Epom.configure do |config|
	config.epom_server = 'https://n29.epom.com/'
	config.username = ENV['username']
	config.password = ENV['password']

	config.proxy_address = ENV['proxy_address']
	config.proxy_port = ENV['proxy_port']
	config.proxy_user = ENV['proxy_user']
	config.proxy_password = ENV['proxy_password']
end