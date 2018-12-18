require './lib/messagehistory.rb'
require 'sinatra/base'

class Messenger < Sinatra::Base
  enable :sessions
  use Rack::Session::Pool, expire_after: 2_592_000

  get '/' do
    session[:message_history] ||= MessageHistory.new
    redirect '/index'
  end

  get '/index' do
    @message_history = session[:message_history]
    @list = @message_history.list
    erb :index
  end

  post '/message_storage' do
    @message_history = session[:message_history]
    message = Message.new(params[:message])
    @message_history.add_to_list(message)
    redirect '/index'
  end

  run! if app_file == $PROGRAM_NAME
end
