module Task_Controllers
	def all
		begin
			tasks = Task.all
			return JSON.parse(Tasks.to_json)
		rescue Exception => e
			return []
		end
	end
	def delete
		begin
			task = Task.where(id: params[:id]).first
			Task.destroy if Task
			status 204
		rescue Exception => e
			status 404
		end
	end
	def add
		begin
		Task.create(:title => params[:title],:description => params[:description],
		:topic => params[:topic],:status => params[:status])
		rescue Exception => e
			status 404
		end
	end
	def update
		begin
	    @task = Task.where(id: id).first
    	@task.update_attributes(:title => params[:title],
    	:description => params[:description],
		:topic => params[:topic],:status => params[:status]) if @Task
    	status 204
		rescue Exception => e
			status 404
		end
	end
end