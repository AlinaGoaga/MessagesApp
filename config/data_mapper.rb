require './lib/message'

DataMapper.setup(:default, "postgres://localhost/messages_manager_#{Sinatra::Base.environment}")
DataMapper.finalize
