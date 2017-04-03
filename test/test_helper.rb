require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'minitest/autorun'

require 'yt/audit'

Yt.configure do |config|
  config.log_level = :debug
  config.api_key = ENV['YT_SERVER_API_KEY']
end
