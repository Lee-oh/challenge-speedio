require "json"
require "./controllers/task.rb"
require "./controllers/rabbitmq.rb"
require "./models/task.rb"

class App < Sinatra::Base
	include Task_Controllers
	include RabbitMQ
	configure do
		Mongoid.load!("./config/mongoid.yml", settings.environment)
		enable :sessions
	end
	before do
    	content_type 'application/json'
  	end
  	#task route main 
  	get '/' do
  		"Api Sinatra RabbitMQ"
  	end
  	#rabbit routes
  	post '/send_tasks_rabbit' do
  		data =  request.body.read
  		if send_broker(data)
  			"Success!"
  		end
  	end
  	get '/get_tasks_rabbit' do
  	end
  	#task crude routes 
	get '/task' do
		@tasks = Task.all
		@tasks.to_json
	end
	get '/task/:id' do |id|
		data_json =  JSON.parse(request.body.read)
		@task = Task.where(id: id).first
		@task.to_json	
	end
	post '/task' do
		data_json =  JSON.parse(request.body.read)
		@task = Task.create(data_json)
		@task.to_json
	end
	delete '/task/:id' do |id|
	    @task = Task.where(id: id).first
	    @task.destroy if @task
	    status 204
	end
	put '/task/:id' do |id|
		data_json =  JSON.parse(request.body.read)
		@task = Task.where(id: id).first
    	@task.update_attributes(data_json)
	end
	not_found do
		"Route not found!"
	end
end

