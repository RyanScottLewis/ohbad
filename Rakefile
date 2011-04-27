require 'rubygems'
require 'rake'

require 'rake/testtask'

desc "Run all our tests"
task :test do
  Rake::TestTask.new do |t|
    t.libs << "test" << "lib"
    t.pattern = "test/**/test_*.rb"
    t.verbose = false
  end
end

task :default => :test