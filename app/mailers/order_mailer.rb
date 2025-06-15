class OrderMailer < ApplicationMailer
  def order_confirmation(order, recipient_email)
    @order = order
    @product = order.products.first # o ajustá si es múltiple

    mail(
      to: recipient_email,
      subject: "✅ Confirmación de tu compra en Circu"
    )
  end

  def admin_order_notification(order)
    @order = order
    @product = order.products.first
    @customer = order.email

    mail(
      to: ["nico@mvpbuilders.tech", "admin@shopcircu.com"],
      subject: "🛒 Nueva orden creada ##{@order.id} – #{@product.title}"
    )
  end
end
