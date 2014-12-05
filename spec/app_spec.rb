require 'spec_helper'
require './app'

describe "CRUD Usuario" do
	before do
		id = @user.create ({
			nm_usuario = 'Antonio'
			nm_endereco = 'Rua'
			nr_cpf = '123456789010'
			nm_sexo = 'M'
			nr_telefone = '1333333333'
			dt_data = '20/01/1984'
			})
	end

	after do
		@user.destroy
	end

	it "criar usuario" do
		visit '/'
		click_link('Novo Usuário')
		fill_in('Nome', with: 'Antonio')
		fill_in('Endereço', with: 'Rua')
		fill_in('CPF', with: '123456789010' )
		fill_in('Sexo', with: 'M')
		fill_in('Telefone', with: '1333333333')
		fill_in('Data', with: '20/01/1984')
		click_button('Criar')

		expect(page).to have_content('Antonio')
	end

	it "editar usuario" do
		
		visit '/users/id'
		click_link('Editar Usuário')
		fill_in('Nome', with: 'Antonio')
		fill_in('Endereço', with: 'Rua')
		fill_in('CPF', with: '123456789010' )
		fill_in('Sexo', with: 'M')
		fill_in('Telefone', with: '1333333333')
		fill_in('Data', with: '20/01/1984')
		click_button('Editar')

		expect(page).to have_content('Antonio')
	end


end