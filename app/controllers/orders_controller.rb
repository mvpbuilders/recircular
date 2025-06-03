class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.total_amount = @order.product.precio * @order.quantity
    @order.currency = "ARS" # o @order.product.currency si lo tenés
    @order.status = "pending"

    if @order.save
      redirect_to checkout_order_path(@order)
    else
      @product = @order.product
      flash[:error] = @order.errors.full_messages.join(", ")
      render "products/show", status: :unprocessable_entity
    end
  end

  def checkout
    @order = Order.find(params[:id])
    @product = @order.product
  end

  private

  def order_params
    params.require(:order).permit(
      :email,
      :quantity,
      :product_id
    )
  end
end
