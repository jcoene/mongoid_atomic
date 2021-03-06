# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mongoid_atomic}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Coene"]
  s.date = %q{2010-07-17}
  s.description = %q{A collection of instance methods to more easily perform atomic updates to your Mongoid models.}
  s.email = %q{jcoene@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "README.rdoc",
     "VERSION",
     "lib/mongoid_atomic.rb"
  ]
  s.homepage = %q{http://github.com/jcoene/mongoid_atomic}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Atomic updates for your Mongoid models.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mongoid>, ["~> 2.0.0.beta4"])
    else
      s.add_dependency(%q<mongoid>, ["~> 2.0.0.beta4"])
    end
  else
    s.add_dependency(%q<mongoid>, ["~> 2.0.0.beta4"])
  end
end

