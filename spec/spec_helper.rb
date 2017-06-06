Dir[File.expand_path('./lib/' + '*.rb')].each{ |file| require file }

require 'bundler'
Bundler.require
