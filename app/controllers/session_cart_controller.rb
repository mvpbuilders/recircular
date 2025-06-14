class SessionCartController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, only: [:add_to_cart]

  def add_to_cart
    session[:cart] ||= {}

    product = Product.find(params[:id])
    
    # No agregar si ya está en el carrito
    unless session[:cart].key?(product.id.to_s)
      session[:cart][product.id.to_s] = 1
    end

    redirect_to product_path(product), notice: "Producto agregado al carrito"
  end


  def remove_from_cart
    session[:cart]&.delete(params[:id])
    redirect_back fallback_location: root_path, notice: "Producto eliminado del carrito"
  end

end
