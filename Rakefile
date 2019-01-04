require 'sinatra/base'
# comes with environment set to dev (Sinatra::Base.environment == dev)
# unless i specify RACK_ENV=test in the command
# $ rake db:auto_migrate RACK_ENV=test
# this will cause Sinatra::Base.environment to become test
require './config/data_mapper'

namespace :db do

  desc "auto_upgrade"

  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Upgrade successful!'
  end

  desc "auto_migrate"
  
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Migration successful!'
  end

end
