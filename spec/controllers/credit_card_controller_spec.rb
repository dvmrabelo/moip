require 'rails_helper'


RSpec.describe CreditCardController, type: :controller do
  it 'API create credit card approved' do
    @client = Client.create()
      post :create, params: {:transaction => { :client => {id: 1}, buyer:
        { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
        :payment => {:amount => 123, :description => "boleto",
        :card => {:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234",
        :cardExpirationDate => "02/25", :cardCvv => "123"}}}}
      expect(response.body).to include("0")
  end

  it 'API create credit card 100' do
    @client = Client.create()
      post :create, params: {:transaction => { :client => {id: 1}, buyer:
        { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
        :payment => {:amount => 100, :description => "boleto",
        :card => {:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234",
        :cardExpirationDate => "02/25", :cardCvv => "123"}}}}
      expect(response.body).to include("100")
  end

  it 'API create credit card 200' do
    @client = Client.create()
      post :create, params: {:transaction => { :client => {id: 1}, buyer:
        { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
        :payment => {:amount => 200, :description => "boleto",
        :card => {:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234",
        :cardExpirationDate => "02/25", :cardCvv => "123"}}}}
      expect(response.body).to include("200")
  end

  it 'API create credit card 300' do
    @client = Client.create()
      post :create, params: {:transaction => { :client => {id: 1}, buyer:
        { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
        :payment => {:amount => 300, :description => "boleto",
        :card => {:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234",
        :cardExpirationDate => "02/25", :cardCvv => "123"}}}}
      expect(response.body).to include("300")
  end

  it 'API create credit card 624' do
    @client = Client.create()
      post :create, params: {:transaction => { :client => {id: 1}, buyer:
        { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
        :payment => {:amount => 624, :description => "boleto",
        :card => {:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234",
        :cardExpirationDate => "02/25", :cardCvv => "123"}}}}
      expect(response.body).to include("624")
  end
end

