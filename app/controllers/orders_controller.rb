class OrdersController < ApplicationController
  def checkout
    @cart_products = session[:cart]&.map do |id, _|
      Product.find_by(id: id)
    end.compact

    @total = @cart_products.sum { |p| p.precio.to_i }
  end

  def create
    cart = session[:cart] || {}
    products = Product.where(id: cart.keys)

    if products.empty?
      redirect_to checkout_orders_path, alert: "Tu carrito está vacío. Agregá productos antes de continuar."
      return
    end
    cart = session[:cart] || {}
    products = Product.where(id: cart.keys)

    # 🛑 Validación: si hay productos no disponibles, redirigir
    unavailable_products = products.select { |p| !p.available }
    if unavailable_products.any?
      nombres = unavailable_products.map(&:title).join(", ")
      redirect_to checkout_orders_path, alert: "Los siguientes productos ya no están disponibles: #{nombres}"
      return
    end

    # Costos desde el formulario
    envio = params[:envio].to_i
    envio_costo = envio == 1 ? 0 : envio
    email = params[:email]
    direccion = params[:direccion]
    telefono = params[:telefono]

    total = products.sum { |p| p.precio.to_i } + envio_costo

    order = Order.create!(
      total_amount: total,
      status: "pending",
      email: email,
      direccion: direccion,
      envio: envio,
      telefono: telefono
    )

    products.each do |product|
      OrderItem.create!(
        order: order,
        product: product,
        price: product.precio
      )
    end

    session[:cart] = {}
    redirect_to payment_order_path(order)
  end

  def resume
    @order = Order.includes(order_items: :product).find(params[:id])
  end

  def reset_cart
    session[:cart] = {}
    redirect_to root_path, notice: "Carrito vaciado correctamente"
  end

  def create_preference
    order = Order.find(params[:id])
    payment = order.payment || order.create_payment!(
      price_cents: order.total_amount.to_i * 100,
      status: :pending,
      payment_method: :mercadopago
    )
    client = MercadoPagoClient.new(
      access_token: Rails.application.credentials.dig(:mercadopago, :access_token) || ENV['MERCADO_PAGO_ACCESS_TOKEN']
    )

    response = client.create_preference(order, nil, params, payment.id)

    render json: { preference_id: response[:preference_id] }
  end

  def process_payment
    order = Order.find(params[:id])
    client = MercadoPagoClient.new(
      access_token: Rails.application.credentials.dig(:mercadopago, :access_token) || ENV['MERCADO_PAGO_ACCESS_TOKEN']
    )

    payment = order.payment || order.create_payment!(
      price_cents: order.total_amount.to_i * 100,
      status: :pending,
      payment_method: :mercadopago
    )

    global_id = payment.id

    response = client.create_payment(order, nil, params, global_id)

    if response[:success]
      payment.update!(status: :paid, payment_info: response[:body])
      order.update!(status: :paid)
      order.order_items.each do |item|
        item.product.update!(available: false)
      end


      # # 🔔 Envío de mails
      # OrderMailer.with(order: order).order_confirmation.deliver_later if order.email.present?
      # OrderMailer.with(order: order).admin_order_notification.deliver_later

      render json: { success: true, redirect_url: resume_order_path(order) }
    else
      payment.update!(status: :failed, payment_info: response[:body])
      render json: { success: false, message: "Error al procesar el pago" }
    end
  end

  def payment
    @order = Order.find(params[:id])
    @public_key = Rails.application.credentials.dig(:mercadopago, :public_key) || ENV["MERCADO_PAGO_PUBLIC_KEY"]
  end
end
