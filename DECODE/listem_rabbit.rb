require "json"
require "bunny"
require 'mongoid'
require "./models/task.rb"

Mongoid.load!("./config/mongoid.yml", :development)
@data = ""
@connection = Bunny.new("amqp://bxpwmxwi:we0acxhQzG_9wgxq1m-2OHeX01CB8dnY@termite.rmq.cloudamqp.com/bxpwmxwi")
@connection.start
@channel = @connection.create_channel
@queue = @channel.queue("message")

begin
  puts ' [*] Waiting for messages. To exit press CTRL+C'
  @queue.subscribe(block: true) do |_delivery_info, _properties, body|
    puts "#{body}"
    @data = JSON.parse(body)
    @task = Task.create(@data)
    if @task.save
    	puts "--------------------------------------------------------------"
    	puts "Success!"
    end
  end

rescue Interrupt =>
  connection.close
  exit(0)
end