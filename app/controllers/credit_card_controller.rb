class CreditCardController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    amount = params[:transaction][:payment][:amount]
    if amount == "100"
      @result = {"result": 100}
      render json: @result
    elsif amount == "200"
      @result = {"result": 200}
      render json: @result
    elsif amount == "300"
      @result = {"result": 300}
      render json: @result
    elsif amount == "624"
      @result = {"result": 624}
      render json: @result
    else
      @buyer = Buyer.create(transaction_params[:buyer])
      @id = transaction_params[:client][:id]
      @client = Client.find(@id)
      @card = Card.create(transaction_params[:payment][:card])
      @pay = transaction_params[:payment].except(:card)
      @pay = @pay.merge!(:card => @card)
      @payment = Payment.create(@pay)
      @boleto = Transaction.create([:client_id => @client[:id], :payment_id => @payment[:id], :buyer_id => @buyer[:id]])
      @result = {"result": 0}
      render json: @result
    end
  end

   def transaction_params
    params.require(:transaction).permit!
  end
end
