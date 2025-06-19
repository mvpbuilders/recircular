# app/models/order.rb
class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  has_one :payment, dependent: :destroy

  enum status: {
    pending: "pending",
    paid: "paid",
    canceled: "canceled"
  }

  validates :email, allow_blank: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :total_amount, presence: true, numericality: { greater_than: 0 }

  # Ejemplo de callback si querés disparar algo después del pago
  after_commit :send_emails_if_paid, if: :paid_status_set?, on: :update

  def paid_status_set?
    saved_change_to_status? && status == :paid
  end

  def send_emails_if_paid
     OrderMailer.with(order: self).order_confirmation.deliver_later if email.present?
     OrderMailer.with(order: self).admin_order_notification.deliver_later
 end

  def envio_con_label
    case envio.to_i
    when 1
      "1 – Retiro GRATIS x Vadeka"
    when 9900
      "9900 – CABA (+$9.900)"
    when 12500
      "12500 – AMBA (+$12.500)"
    when 0
      "0 – Otras Zonas (coordinaremos vía WhatsApp)"
    else
      envio.to_s
    end
  end

end
