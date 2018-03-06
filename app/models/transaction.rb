class Transaction < ApplicationRecord
  belongs_to :client
  belongs_to :buyer
  belongs_to :payment
  validates :client, presence: true
  validates :buyer, presence: true
  validates :payment, presence: true
end
