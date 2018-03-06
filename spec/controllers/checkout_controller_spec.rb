require 'rails_helper'


RSpec.describe CheckoutController, type: :controller do
  it 'reponds successfully boleto' do
    get :boleto
    expect(response).to be_success  
  end

  it 'reponds a 200 response boleto' do
    get :boleto
    expect(response).to have_http_status(200)  
  end

  it 'reponds successfully credit card' do
    get :credit_card
    expect(response).to be_success  
  end

  it 'reponds a 200 response credit card' do
    get :credit_card
    expect(response).to have_http_status(200)  
  end

  it 'create boleto' do
    @client = Client.create()
    post :boleto_create, params: {:transaction => { :client => {id: 1}, buyer:
      { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
      :payment => {:amount => 123, :description => "boleto"}}}
    get :result_boleto, params: {id: 1}
    expect(response).to render_template(:result_boleto)
  end

  it 'create transaction credit card' do 
    @client = Client.create()
    post :credit_card_create, params: {:transaction => { :client => {id: 1}, buyer:
      { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
      :payment => {:amount => 123, :description => "credit_card",
        :card => {:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234",
          :cardExpirationDate => "02/25", :cardCvv => "123"}}}}
    get :result_credit_card, params: {result: 0}
    expect(response).to render_template(:result_credit_card)
  end

  it 'transaction return 100' do
    @client = Client.create()
    @card = Card.create(:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234", :cardExpirationDate => "02/25", :cardCvv => "123")
    post :credit_card_create, params: {:transaction => { :client => {id: 1}, buyer:
      { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
      :payment => {:amount => 100, :description => "credit_card",
        :card => {:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234",
          :cardExpirationDate => "02/25", :cardCvv => "123"}}}}
    get :result_credit_card, params: {result: 100}
    expect(response).to render_template(:result_credit_card)
  end

  it 'transaction return 200' do
    @client = Client.create()
    @card = Card.create(:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234", :cardExpirationDate => "02/25", :cardCvv => "123")
    post :credit_card_create, params: {:transaction => { :client => {id: 1}, buyer:
      { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
      :payment => {:amount => 200, :description => "credit_card",
        :card => {:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234",
          :cardExpirationDate => "02/25", :cardCvv => "123"}}}}
    get :result_credit_card, params: {result: 200}
    expect(response).to render_template(:result_credit_card)
  end

  it 'transaction return 300' do
    @client = Client.create()
    @card = Card.create(:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234", :cardExpirationDate => "02/25", :cardCvv => "123")
    post :credit_card_create, params: {:transaction => { :client => {id: 1}, buyer:
      { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
      :payment => {:amount => 300, :description => "credit_card",
        :card => {:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234",
          :cardExpirationDate => "02/25", :cardCvv => "123"}}}}
    get :result_credit_card, params: {result: 300}
    expect(response).to render_template(:result_credit_card)
  end

  it 'transaction return 624' do
    @client = Client.create()
    @card = Card.create(:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234", :cardExpirationDate => "02/25", :cardCvv => "123")
    post :credit_card_create, params: {:transaction => { :client => {id: 1}, buyer:
      { :name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900" }, 
      :payment => {:amount => 624, :description => "credit_card",
        :card => {:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234",
          :cardExpirationDate => "02/25", :cardCvv => "123"}}}}
    get :result_credit_card, params: {result: 624}
    expect(response).to render_template(:result_credit_card)
  end
end

