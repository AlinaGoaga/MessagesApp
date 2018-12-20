
require './lib/message'

DataMapper.setup(:default, "postgres://localhost/messages_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade! if ENV['RACK_ENV'] = 'development'
DataMapper.auto_migrate! if ENV['RACK_ENV'] = 'test'
