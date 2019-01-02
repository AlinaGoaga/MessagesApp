require './lib/message_and_tag'

DataMapper.setup(:default, "postgres://localhost/messages_manager_#{Sinatra::Base.environment}")
DataMapper.finalize
