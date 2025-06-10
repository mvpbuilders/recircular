class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  has_one :payment, dependent: :destroy

  enum status: { pending: "pending", paid: "paid", canceled: "canceled" }

  validates :email, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :total_amount, presence: true, numericality: { greater_than: 0 }
end
