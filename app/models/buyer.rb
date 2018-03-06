class Buyer < ApplicationRecord
  has_one :owner, foreign_key: "buyer_id", class_name: "Transaction"
  accepts_nested_attributes_for :owner
  validates :name, presence: true
  validates :email, presence: true
  validates :cpf, presence: true
end

