require 'sinatra/base'

class Messenger < Sinatra::Base
  enable :sessions

  get '/' do
    @message = session[:message]
    erb :index
  end

  post '/message_storage' do
    session[:message] = params[:message]
    redirect "/"
  end

  run! if app_file == $PROGRAM_NAME
end
