require './lib/message.rb'
require 'sinatra/base'

class Messenger < Sinatra::Base
  enable :sessions

  get '/' do
    @text = session[:text]
    @time = session[:time]
    erb :index
  end

  post '/message_storage' do
    message = Message.new(params[:message])
    session[:text] = message.text
    session[:time] = message.time
    redirect "/"
  end

  run! if app_file == $PROGRAM_NAME
end
