require "rubygems"
require "bundler"

Bundler.require(:default)

Mongoid.config.master = Mongo::Connection.new.db("mongoid_atomic_test")

require File.expand_path("../../lib/mongoid_atomic", __FILE__)
Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |f| require f }

DatabaseCleaner.orm = "mongoid"

Rspec.configure do |config|
  config.before(:all) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
