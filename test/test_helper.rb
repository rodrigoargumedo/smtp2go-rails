# Configure Rails Environment
ENV["RAILS_ENV"] = "test"
require 'rails/test_unit/reporter'
require 'coveralls'
require 'debug'
Coveralls.wear!('rails')


require File.expand_path("../../test/dummy/config/environment.rb", __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
require "rails/test_help"
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
end

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

Rails::TestUnitReporter.executable = 'bin/test'

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end

ENV['SMTP2GO_API_KEY'] = 'test-api-key'

class DefaultValuesTestMailer < Smtp2go::Smtp2goMailer
  default :to => ['dave@example.com']
  default :from => 'matt@example.com'
  default :subject => 'Test Message'
  default :body => 'Test Content'
end

class TestMailer < Smtp2go::Smtp2goMailer
end
