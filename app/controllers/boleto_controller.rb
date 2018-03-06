class BoletoController < ApplicationController
  require 'time'
  skip_before_action :verify_authenticity_token
  def create
    p params
    amount = params[:transaction][:payment][:amount]
    @buyer = Buyer.create(boleto_params[:buyer])
    @id = boleto_params[:client][:id]
    @client = Client.find(@id)
    @payment = Payment.create(boleto_params[:payment])
    @boleto = Transaction.create([:client_id => @client[:id], :payment_id => @payment[:id], :buyer_id => @buyer[:id]])
    @number = boletoNumber(amount)
    render json: {"number_boleto": @number}
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
 
  def boleto_params
    params.require(:transaction).permit!
  end

end
