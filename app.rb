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
    @list = session[:message_history].list
    erb :index
  end

  post '/message_storage' do
    message = Message.new(params[:message], session[:id])
    session[:message_history].add_to_list(message)
    session[:id] += 1
    redirect '/index'
  end

  get '/messages/:id' do
    id = params[:id].to_i
    @message = session[:message_history].find(id)
    erb :message
  end

  run! if app_file == $PROGRAM_NAME
end
