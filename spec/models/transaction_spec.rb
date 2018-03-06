require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'is valid boleto' do
    @client = Client.create()
    @buyer = Buyer.create(:name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900")
    @payment = Payment.create(:amount => 123, :description => "boleto")
    @transaction = Transaction.create!(:client_id => @client[:id], :buyer_id => @payment[:id], :payment_id => @buyer[:id])
    expect(@transaction).to be_valid
  end

  it 'is valid credit card' do
    @client = Client.create()
    @buyer = Buyer.create(:name => "Diogenes", :email => "drabelo@moip.com.br", :cpf => "12345678900")
    @card = Card.create(:cardHolderName => "Diogenes V M Rabelo", :cardNumber => "1234123412341234", :cardExpirationDate => "02/25", :cardCvv => "123")
    @payment = Payment.create(:amount => 123, :description => "credit_card", :card => @card)
    @transaction = Transaction.create!(:client_id => @client[:id], :buyer_id => @payment[:id], :payment_id => @buyer[:id])
    expect(@transaction).to be_valid
  end
end

