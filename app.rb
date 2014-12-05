require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'

enable :sessions


class Usuario < ActiveRecord::Base
	validates :nm_usuario, presence: true
	validates :nm_endereco, presence: true
	validates :nr_cpf, presence: true, length: { minimum: 11 }
	validates :nm_sexo, presence: true
	validates :nr_telefone, presence: true
	validates :dt_data, presence: true
end

get '/' do
	@users = Usuario.order("created_at DESC")
	@title = "Bem Vindo"
	erb :"users/index"
end

helpers do
	include Rack::Utils
  	alias_method :h, :escape_html
	def title
		if @title
			"#{@title}"
		else
			"Bem Vindo"
		end
	end
end

get "/users/create" do
	@title = "Criação de Usuário"
	@user = Usuario.new
	erb :"users/create"
end

post "/users" do
	@user = Usuario.new(params[:user])
	if @user.save
		redirect "users/#{@user.id}", :notice => 'Usuário inserido com sucesso'
	else
		erb :"users/create", :error => 'Falha ao inserir Usuário'
	end
end

#visualizar usuarios

get "/users/:id" do
	@user = Usuario.find(params[:id])
	@title = @user.nm_usuario
	erb :"users/view"
end

#editar usuários

get "/users/:id/edit" do
	@user = Usuario.find(params[:id])
	@title = "Editar Usuario"
	erb :"users/edit"
end

put "/users/:id" do
	@user = Usuario.find(params[:id])
	@user.update(params[:user])
	redirect "/users/#{@user.id}"
end

#deletar usuários

get "/users/:id/delete" do
	@user = Usuario.find(params[:id])
	@title = "Deletar Usuário"
	erb :"users/delete"
end

delete "/users/:id/delete" do
	@user = Usuario.find(params[:id])
	@user.destroy
	redirect "/"
end

