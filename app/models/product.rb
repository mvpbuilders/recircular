class Product < ApplicationRecord
  has_many_attached :images
  has_many :order_items
  has_many :paid_order_items, -> { joins(:order).where(orders: { status: "paid" }) }, class_name: "OrderItem"

end
