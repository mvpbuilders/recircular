# frozen_string_literal: true

require "mercadopago"

class MercadoPagoClient
  def initialize(access_token:)
    @access_token = access_token
    @sdk = Mercadopago::SDK.new(access_token)
    @host_url = if Rails.env.development?
                  "https://based.ar" else Rails.application.default_url_options.dig(:host)
                end
  end

  def create_link_payment(items:, global_id:, order_id:)
    order = Order.find(order_id)

    shipping = {
      title: "Envío",
      quantity: 1,
      currency_id: "ARS",
      unit_price: order.delivery_cents.to_f / 100,
      description: "Costo de Envío",
    }

    preference_data = {
      items: items.map do |item|
        {
          id: item[:id],
          title: item[:title],
          quantity: item[:quantity],
          currency_id: item[:currency_id],
          unit_price: item[:unit_price].to_f,
          description: item[:description],
        }
      end << shipping,
      back_urls: {
        success: @host_url + "/orders/#{order_id}/resume",
      },
      notification_url: "https://based.ar/payments/mp_hook?g_id=#{global_id}",
      auto_return: "approved",
    }

    result = @sdk.preference.create(preference_data)
    result.dig(:response, "init_point")
  end

  def get_payment(id)
    @conn = Faraday.new(
      url: "https://api.mercadopago.com/v1/payments/",
      headers: {
        Authorization: "Bearer #{@access_token}",
      },
    )
    response = @conn.get(id.to_s)
    JSON.parse(response.body)
  end

  def get_preapproval(id)
    @conn = Faraday.new(
      url: "https://api.mercadopago.com/preapproval/",
      headers: {
        Authorization: "Bearer #{@access_token}",
      },
    )
    response = @conn.get(id.to_s)
    JSON.parse(response.body)
  end

  def create_preapproval(community, client, card_data, global_id)
    payload = {
      preapproval_plan_id: community.mp_plan_id.to_s,
      reason: community.title,
      external_reference: "#{Date.today}-Community:##{community.id}-Client:##{client.id}",
      payer_email: client.email.to_s,
      card_token_id: card_data["token"],
      auto_recurring: {
        frequency: 1,
        frequency_type: "months",
        start_date: Date.today,
        end_date: nil,
        transaction_amount: community.price_cents,
        currency_id: "ARS",
      },
      back_url: "https://www.mercadopago.com.ar",
      status: "authorized",
      notification_url: "https://based.ar/payments/mp_hook?g_id=#{global_id}",
    }

    response = Faraday.post("https://api.mercadopago.com/preapproval") do |req|
      req.headers["Authorization"] = "Bearer #{@access_token}"
      req.headers["Content-Type"] = "application/json"
      req.body = payload.to_json
    end

    body = JSON.parse(response.body)

    if response.success?
      ClientSubscription.create(
        client:,
        community:,
        status: :authorized,
        subscription_id: body["id"],
      )
    end

    { success: response.success?, body: }
  end

  # rubocop:disable all
  def create_payment(order, user, params, global_id)
    sdk = Mercadopago::SDK.new(@access_token)

    payment_data = {
      transaction_amount: params[:transaction_amount].to_f,
      token: params[:token],
      description: "Pago de Orden ##{order.id}",
      installments: params[:installments],
      payment_method_id: params[:payment_method_id],
      issuer_id: params[:issuer_id],
      payer: {
        email: params.dig(:payer, :email),
        identification: {
          type: params.dig(:payer, :identification, :type),
          number: params.dig(:payer, :identification, :number)
        }
      },
      metadata: {
        global_id: global_id
      }
    }

    puts ">>> Enviando a MP: #{payment_data}"
    response = sdk.payment.create(payment_data)
    puts ">>> Respuesta de MP: #{response.inspect}"

    {
      success: response[:status] == 201,
      body: response[:response]
    }
  end 


  def create_preference(order, client, params, global_id)
    sdk = Mercadopago::SDK.new(Rails.application.credentials.dig(:mercado_pago, :access_token))
    
    # Create a preference object
    preference_data = {
      purpose: "wallet_purchase",
      items: [
        {
          title: "Pago de Orden ##{order.id}",
          unit_price: order.amount_cents.to_f / 100,
          quantity: 1,
        },
      ],
      back_urls: {
        success: "#{@host_url}/orders/#{order.id}/resume",
      },
      notification_url: "#{@host_url}/payments/mp_hook?g_id=#{order&.payment&.id}",
    }
    preference_response = sdk.preference.create(preference_data)
    preference = preference_response[:response]

    @preference_id = preference["id"]
    { preference_id: preference["id"] }
  end
end
