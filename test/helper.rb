require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'riot'
# Remove color from Riot >=( Damn windows..
module Riot
  class StoryReporter < IOReporter
    def describe_context(context)
      super
      puts context.detailed_description
    end
    def pass(description, message); puts "  + " + "#{description} #{message}".strip; end
    def fail(description, message, line, file); puts "  - " + "#{description}: #{message} #{line_info(line, file)}".strip; end
    def error(description, e); puts "  ! " + "#{description}: #{e.message}"; end
  end # StoryReporter
end # Riot


$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'hexadecimal'