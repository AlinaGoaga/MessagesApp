require './lib/message'

DataMapper.setup(:default, "postgres://localhost/messages_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
