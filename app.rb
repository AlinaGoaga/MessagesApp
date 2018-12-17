require './lib/messagehistory.rb'
require 'sinatra/base'

class Messenger < Sinatra::Base
  enable :sessions

  get '/' do
   session[:message_history] = MessageHistory.new
   redirect "/index"
  end

  get '/index' do
    @message_history = session[:message_history]
    @list = @message_history.list
    erb :index
  end

  post '/message_storage' do
    message = Message.new(params[:message])
    @message_history = session[:message_history]
    @message_history.add_to_list(message)
    redirect "/index"
  end

  run! if app_file == $PROGRAM_NAME
end
