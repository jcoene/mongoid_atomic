require 'rspec/core/rake_task'
require 'jeweler'

task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

Jeweler::Tasks.new do |g|
	g.name = "mongoid_atomic"
	g.summary = "Atomic updates for your Mongoid models."
	g.description = "A collection of instance methods to more easily perform atomic updates to your Mongoid models."
	g.add_runtime_dependency("mongoid", ["~>2.0.0.beta4"])
	g.files = %w[README.rdoc VERSION lib/mongoid_atomic.rb]
	g.require_path = "lib"
	g.email = "jcoene@gmail.com"
	g.homepage = "http://github.com/jcoene/mongoid_atomic"
	g.authors = ["Jason Coene"]
end

Jeweler::GemcutterTasks.new

