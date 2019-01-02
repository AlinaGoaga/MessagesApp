# ENV['RACK_ENV'] ||= 'development' - this is set up by default in Sinatra  Sinatra::Base.development? == true

require 'sinatra/base'
require './lib/message'
require './config/data_mapper'
require 'pry'
require 'haml'

class MessageApp < Sinatra::Base

  set :method_override, true

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/message' do
    Message.create(content: params[:content])
    redirect '/'
  end

  get '/messages/:id' do
    # page for individual messages
    @message = Message.get(params[:id])
    erb :show
  end

  get '/messages/:id/edit' do
    # page for individual messages to be displayed
    @message = Message.get(params[:id])
    erb :edit, :layout => :edit_page_layout  
  end

  patch '/messages/:id' do # edit action
    @message = Message.get(params[:id])
    @message.content = params[:content]
    @message.save
    redirect '/'
  end

  delete '/messages/:id/delete' do # delete action
    Message.get(params[:id]).destroy
    redirect '/'
  end

end
