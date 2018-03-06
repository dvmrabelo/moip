Rails.application.routes.draw do
  get 'checkout/boleto', to: 'checkout#boleto'
  get 'checkout/result/:id', to: 'checkout#result_boleto', as: :result_boleto
  get 'checkout/result_credit/:result', to: 'checkout#result_credit_card', as: :result_credit_card
  get 'checkout/creditcard', to: 'checkout#credit_card'
  post 'checkout/boleto', to: 'checkout#boleto_create', as: :boleto_create
  post 'checkout/credit_card', to: 'checkout#credit_card_create', as: :credit_card_create
  root 'checkout#index'
  post 'api/credit_card', to: 'credit_card#create', as: :credit_card
  post 'api/boleto', to: 'boleto#create', as: :boleto
 
end
