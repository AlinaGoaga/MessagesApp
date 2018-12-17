require 'sinatra/base'

class Messenger < Sinatra::Base
  enable :sessions

  run! if app_file == $PROGRAM_NAME
end
