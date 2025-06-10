class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def mp_hook
    payment_id = Payment.find_by("payment_info ->> 'id' = ?", params["data"]["id"].to_s)&.id
    payment = Payment.find(params[:g_id] || payment_id)

    client = MercadoPagoClient.new(access_token: ENV["MERCADO_PAGO_ACCESS_TOKEN"])
    payment_data = client.get_payment(params["data"]["id"])

    if payment_data["status"] == "approved"
      payment.update!(status: :paid)
      payment.order.update!(status: "paid") if payment.order.pending?
    else
      payment.update!(status: :failed)
    end

    head :ok
  end
end
