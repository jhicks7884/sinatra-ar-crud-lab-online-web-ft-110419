
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/posts' do
    erb :index
  end

  get 'posts/new' do
    @post = Post.new
    erb :form
  end

  get 'posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :form
  end

  get 'posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  post '/posts' do
    Post.create(params[:post])
    redirect '/posts'
  end

  delete '/post/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
    erb :delete
  end

  patch '/posts/:id' do
    post =Post.find(params[:id])
    post.update(params[:post])
    redirect "/posts/#{post.id}"
  end

end
