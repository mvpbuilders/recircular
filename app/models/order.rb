# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :product

  enum status: {
    pending: 0,
    paid: 1,
    canceled: 2
  }

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :total_amount, presence: true
end
