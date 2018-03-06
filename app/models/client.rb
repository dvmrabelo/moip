class Client < ApplicationRecord
  has_one :owner, foreign_key: "client_id", class_name: "Transaction"
  accepts_nested_attributes_for :owner
end
