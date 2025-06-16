class HomeController < ApplicationController
  def index
    @best_clothing  = Product.where(tipo: "ropa", available: true).limit(20)
    @best_furniture = Product.where(tipo: "muebles", available: true).limit(20)
    @best_kids      = KidsProduct.where(available: true).limit(20)
    @best_uniforms  = UniformProduct.where(available: true).limit(20)
    @best_others    = OtherProduct.where(available: true).limit(20)
    @best_accessory   = AccessoryProduct.where(available: true).limit(20)
  end
end
