require "json"
require "bunny"
require 'mongoid'
require "./models/task.rb"
require 'time'

Mongoid.load!("./config/mongoid.yml", :development)

@tasks = Task.all
@tasks.to_json
@tasks.each do |task|
	puts task["user_id"]
	puts task["uri"]
	puts task["access_time"]
	puts task["request_method"]
	puts task["user_agent"]
	puts "----------------------------"
	date = task["access_time"].split(")").first.split("(").last
	puts date

end
  