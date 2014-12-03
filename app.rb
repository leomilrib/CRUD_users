require 'sinatra'
require 'sinatra/activerecord'
require './environments'


class Usuario < ActiveRecord::Base
	validates :title, presence: true, length: { minimum: 5 }
end

get '/' do
	@users = Usuario.order("created_at DESC")
	@title = "CRUD Usuario"
	erb :"arq/index"
end

helpers do
  	def title
    	if @title
      		"#{@title}"
    	else
      		"CRUD Usuario."
    	end
  	end
end

get "/arq/criar" do
	 @title = "Criar Usuario"
	 @users = Usuario.new
	 erb :"arq/criar"
end

post "/arq" do
 @users = Usuario.new(params[:post])
 if @users.save
   redirect "arq/#{@user.id}"
 else
   erb :"arq/criar"
 end
end

get "/users/:id" do
 	@users = Usuario.find(params[:id])
 	@title = @users.title
 	erb :"arq/view"
end

