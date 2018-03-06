require 'rails_helper'


RSpec.describe BoletoController, type: :controller do
  it 'API create boleto' do
    @client = Client.create()
      post :create, params: {:transaction => { :client => {id: 1}, buyer:
        { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
        :payment => {:amount => 123, :description => "boleto"}}}
      expect(response.body).to include("123")
  end
end

