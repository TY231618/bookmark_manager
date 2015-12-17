ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative '../data_mapper_setup.rb'
require_relative './models/link'
require_relative './models/tag'



class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb(:index)
  end

  get '/links/new' do
    erb(:form)
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tag].split.each do |tag|
    link.tags << Tag.create(tag: tag)
   end
    link.save
    redirect '/links'
  end

  get '/links/:tag' do
    tag = Tag.all(tag: params[:tag])
    @links = tag ? tag.links : []
    erb(:index)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
