require 'sinatra/base'
require 'bunny'
require 'mongoid'

class App <  Sinatra::Base
	Dir[File.dirname(__FILE__) + "./app/routes/**"].each do |route|
	  require route
	end
end