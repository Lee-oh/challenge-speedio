module RabbitMQ
	def send_broker(data)
		@rabbitmq_client = Bunny.new("amqp://bxpwmxwi:we0acxhQzG_9wgxq1m-2OHeX01CB8dnY@termite.rmq.cloudamqp.com/bxpwmxwi")
	    @rabbitmq_client.start
	    @channel = @rabbitmq_client.create_channel
	    @queue = @channel.queue("message")
	    @exchange = @channel.exchange("")
	    @exchange.publish("#{data}", :key=>'message')
	    @delivery, @headers, @msg = @queue.pop
	    @rabbitmq_client.close
		puts @msg
	end
end