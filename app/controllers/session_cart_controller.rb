class SessionCartController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, only: [:add_to_cart]

  def add_to_cart
    session[:cart] ||= {}
    product = Product.find(params[:id])
    session[:cart][product.id.to_s] = session[:cart][product.id.to_s].to_i + 1

    redirect_to product_path(product), notice: "Producto agregado al carrito"
  end
end
