class Card < ApplicationRecord
    has_many :payment
    validates :cardHolderName, presence: true
    validates :cardNumber, presence: true
    validates :cardExpirationDate, presence: true
    validates :cardCvv, presence: true
end
