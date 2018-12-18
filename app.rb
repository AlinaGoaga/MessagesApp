require './lib/messagehistory.rb'
require 'sinatra/base'

class Messenger < Sinatra::Base
  enable :sessions
  use Rack::Session::Pool, expire_after: 2_592_000

  get '/' do
    session[:message_history] ||= MessageHistory.new
    session[:id] ||= 1
    redirect '/index'
  end

  get '/index' do
    @message_history = session[:message_history]
    @list = @message_history.list
    erb :index
  end

  post '/message_storage' do
    @message_history = session[:message_history]
    id = session[:id]
    message = Message.new(params[:message], id)
    @message_history.add_to_list(message)
    id += 1
    session[:id] = id
    redirect '/index'
  end

  get '/messages/:id' do
    @message_history = session[:message_history]
    @list = @message_history.list
    id = params[:id].to_i
    @message = @list.find { |x| x['id'] == id }
    erb :message
  end

  run! if app_file == $PROGRAM_NAME
end
