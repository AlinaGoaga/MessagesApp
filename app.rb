# ENV['RACK_ENV'] ||= 'development' - this is set up by default in Sinatra  Sinatra::Base.development? == true

require 'sinatra/base'
require './lib/message_and_tag'
require './config/data_mapper'
require 'pry'

class MessageApp < Sinatra::Base

  set :method_override, true

  get '/' do
    @messages = Message.all
    @tags = Tag.all
    erb :index
  end

  post '/message' do
    Message.create(content: params[:content])
    redirect '/'
  end

  get '/messages/:id' do
    @message = Message.get(params[:id])
    erb :show
  end

  get '/messages/:id/edit' do
    @message = Message.get(params[:id])
    erb :edit, :layout => :edit_page_layout
  end

  patch '/messages/:id' do
    @message = Message.get(params[:id])
    @message.content = params[:content]
    @message.save
    redirect '/'
  end

  delete '/messages/:id/delete' do
    Message.get(params[:id]).tags.destroy if Tag.all.count != 0
    Message.get(params[:id]).destroy
    redirect '/'
  end

  post '/messages/:id/tags' do
    message = Message.get(params[:id])
    tag = Tag.first_or_create(tag_content: params[:tag_content])
    message.tags << tag
    message.save
    redirect '/'
  end
  # 
  # get '/tag' do
  #   @messages = Message.all
  #   @tag = Tag.get(params[:id])
  #   erb :show_tags
  #   redirect '/'
  # end
end
