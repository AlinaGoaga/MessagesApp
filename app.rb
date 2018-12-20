ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './config/data_mapper'

class MessageApp < Sinatra::Base
  get '/' do
    @messages = Message.all
    erb(:index)
  end

  post '/message' do
    Message.create(content: params[:content])
    redirect '/'
  end

  get '/messages/:id' do
    @message = Message.get(params[:id])
    erb(:show)
  end
end
