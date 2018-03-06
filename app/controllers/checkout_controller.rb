class CheckoutController < ApplicationController
    require 'time'
  def index
    
  end

  def boleto
    @clients = Client.all
    @transaction = Transaction.new
  end

  def boleto_create
    amount = params[:transaction][:payment][:amount]
    @buyer = Buyer.create(transaction_params[:buyer])
    @id = transaction_params[:client][:id]
    @client = Client.find(@id)
    @payment = Payment.create(transaction_params[:payment])
    @boleto = Transaction.create([:client_id => @client[:id], :payment_id => @payment[:id], :buyer_id => @buyer[:id]])
    @number = boletoNumber(amount)
    redirect_to controller: 'checkout', action: 'result_boleto', id: @payment
  end

  def boletoNumber amount
    amountCent = (amount * 100).to_s.delete(".")
    dateInit = Date.parse('1997-10-07')
    dateNow = Date.today
    dias = ((dateNow.mjd - dateInit.mjd) + 2).to_s
    amountLeng = 10 - amountCent.length
    boletoNum = "00190.1234" + "#{dias[0]}" + " 54321.0000" + "#{dias[1]}" + 
    + " 98765.8763" + "#{dias[2]}" + " 8" + " " + dias
    (1..amountLeng).each do |i|
      boletoNum = boletoNum + "0"
    end
    boletoNum + amountCent
  end

  def result_boleto
    @payment = Payment.find(params[:id])
    @number = boletoNumber @payment[:amount]
  end

  def result_credit_card
    @result = params[:result]
  end

  def credit_card
    @clients = Client.all
    @transaction = Transaction.new
  end

  def credit_card_create
    amount = transaction_params[:payment][:amount]
    if amount == 100
      @result = 100
      redirect_to action: "result_credit_card", result: @result
    elsif amount == 200
      @result = 200
      redirect_to action: "result_credit_card", result: @result
    elsif amount == 300
      @result = 300
      redirect_to action: "result_credit_card", result: @result
    elsif amount == 624
      @result = 624
      redirect_to action: "result_credit_card", result: @result
    else
      @buyer = Buyer.create(transaction_params[:buyer])
      @id = transaction_params[:client][:id]
      @client = Client.find(@id)
      @card = Card.create(transaction_params[:payment][:card])
      @pay = transaction_params[:payment].except(:card)
      @pay = @pay.merge!(:card => @card)
      @payment = Payment.create(@pay)
      @boleto = Transaction.create([:client_id => @client[:id], :payment_id => @payment[:id], :buyer_id => @buyer[:id]])
      @result = 0
      redirect_to action: "result_credit_card", result: @result
    end
  end

  def transaction_params
    params.require(:transaction).permit!
  end
end
