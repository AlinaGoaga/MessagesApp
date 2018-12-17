require 'sinatra/base'

class Messenger < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
