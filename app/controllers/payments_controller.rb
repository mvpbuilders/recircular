class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def mp_hook
    puts "data ingresa por webhook: #{params}"
    puts "data obtenida: #{params.dig("data", "id")&.to_s}"
    mp_payment_id = params.dig("data", "id")&.to_s
    return head :bad_request unless mp_payment_id.present?

    puts "mp_payment_id: #{mp_payment_id}"
    payment = Payment.find_by("payment_info ->> 'id' = ?", mp_payment_id)
    return head :not_found unless payment

    access_token = Rails.application.credentials.dig(:mercadopago, :access_token) || ENV['MERCADO_PAGO_ACCESS_TOKEN']
    client = MercadoPagoClient.new(access_token:)
    payment_data = client.get_payment(mp_payment_id)

    if payment_data && payment_data["status"] == "approved"
      payment.update!(status: :paid)
      payment.order.update!(status: "paid") if payment.order&.pending?
    else
      payment.update!(status: :failed)
    end

    head :ok
  end

end
