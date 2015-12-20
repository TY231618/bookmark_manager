ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative '../data_mapper_setup.rb'
require_relative './models/link'
require_relative './models/tag'
require_relative './models/user'
require 'sinatra/flash'
class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/users/new' do
    erb(:users)
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.save
      redirect '/links'
    else
      flash.now[:notice] = 'Your passwords do not match!'
      erb(:users)
    end
  end

  get '/' do
    redirect '/users/new'
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
    params[:tag].split(', ').each do |tag|
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

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
