class HomeController < ApplicationController
  def index
    @best_clothing  = Product.where(tipo: "ropa", available: true).limit(8)
    @best_furniture = Product.where(tipo: "muebles", available: true).limit(8)
    @best_kids      = KidsProduct.where(available: true).limit(8)
    @best_uniforms  = UniformProduct.where(available: true).limit(8)
    @best_others    = OtherProduct.where(available: true).limit(8)
  end
end
