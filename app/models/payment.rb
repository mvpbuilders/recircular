class Payment < ApplicationRecord
  monetize :price_cents, as: "price"

  enum status: {
    pending: 0,
    paid: 1,
    failed: 2,
    refunded: 3,
    canceled: 4,
    abandoned: 5,
  }

  enum payment_method: { efectivo: 0, mercadopago: 1 }

  belongs_to :order
end
