class Task
  include Mongoid::Document
  field :uri, type: String
  field :status, type: String
  field :access_time, type: String
  field :request_method, type: String
  field :user_agent, type: String
end 