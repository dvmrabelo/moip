class Payment < ApplicationRecord
  belongs_to :card, optional: true
  has_one :owner, foreign_key: "payment_id", class_name: "Transaction"
  accepts_nested_attributes_for :owner
  validates :amount, presence: true
  validates :description, presence: true
end
