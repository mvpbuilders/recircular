# frozen_string_literal: true

# rubocop:disable all
class PaymentsController < ApplicationController

  def mp_hook
    # payment_id = Payment.all.find_by("payment_info LIKE ?", "%\"id\"=>#{params["data"]["id"]}%")&.id
    # puts "payment_id desde credit/debit form MP: #{payment_id&.inspect}"
    # @payment = Payment.find (params[:g_id] || payment_id)
    # puts "payment: #{@payment.inspect}"
    # puts "payment type: #{params[:type]}"
    # if params[:topic] == "merchant_order" || params[:topic] == "payment"
    # elsif params[:type] == "payment" && params["data"]["id"]
    #   mp_client = MercadoPagoClient.new(
    #     access_token: Rails.application.credentials.dig(:mercadopago, :access_token),
    #   )
    #   payment_data = mp_client.get_payment(params["data"]["id"])
    #   puts "payment data: #{payment_data.inspect}"
    #   if payment_data["status"] == "approved"
    #     if !@payment.paid? && @payment&.order&.status == "pending"
    #       @payment&.order&.update(status: "paid")
    #       @payment.paid!
    #       # Rails.logger.info("Sending confirmation email to #{@payment.order.client.email}")
    #       # OrderMailer.with(order: @payment.order, recipient: @payment.order.client).order_confirmation.deliver_later
    #     end
    #   else
    #     @payment = Payment.find params[:g_id]
    #     @payment.failed!
    #   end
    # else
    #   @payment.failed!
    # end
    head :ok
  end
end
# rubocop:enable all