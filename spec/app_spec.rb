#encoding: UTF-8

require 'spec_helper'
require './app'

describe "CRUD Usuario" do
  before do
    id = Usuario.create(nm_usuario: "Carlos", nm_endereco: "Sambaiatuba", nr_cpf: "98765432109", nm_sexo: "M", nr_telefone: "1444444444", dt_data: "22/02/1982")
  end

  after do
    Usuario.delete_all
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

  it "listar usuario" do
  id = Usuario.create(nm_usuario: "Antonio", nm_endereco: "Sambaiatuba", nr_cpf: "98765432109", nm_sexo: "M", nr_telefone: "1444444444", dt_data: "22/02/1982")
  id = Usuario.create(nm_usuario: "Nogueira", nm_endereco: "Sambaiatuba", nr_cpf: "98765432109", nm_sexo: "M", nr_telefone: "1444444444", dt_data: "22/02/1982")
  id = Usuario.create(nm_usuario: "Junior", nm_endereco: "Sambaiatuba", nr_cpf: "98765432109", nm_sexo: "M", nr_telefone: "1444444444", dt_data: "22/02/1982")
  id = Usuario.create(nm_usuario: "AutoSeg", nm_endereco: "Sambaiatuba", nr_cpf: "98765432109", nm_sexo: "M", nr_telefone: "1444444444", dt_data: "22/02/1982")
  visit '/'
    expect(page).to have_content('Carlos')
    expect(page).to have_content('Antonio')
    expect(page).to have_content('Nogueira')
    expect(page).to have_content('Junior')
    expect(page).to have_content('AutoSeg')
  end

  it "editar usuario" do
    visit '/'
    click_link('Carlos')
    click_link('Editar Usuário')
    fill_in('Nome:', with: 'Antonio')
    fill_in('Endereço', with: 'Rua')
    fill_in('CPF', with: '12340987564' )
    fill_in('Sexo', with: 'M')
    fill_in('Telefone', with: '1333333333')
    fill_in('Data', with: '20/01/1984')
    click_button('Editar')

    expect(page).to have_content('Antonio')
  end

it "deletar usuario" do
    visit '/'
    click_link('Carlos')
    click_link('Deletar Usuário')
    click_button('Deletar')
    expect(page).to have_content('')
  end


end
