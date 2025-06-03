class HomeController < ApplicationController
  def index
    @best_clothing = Product.where(tipo: "ropa").limit(8)
    @best_furniture = Product.where(tipo: "muebles").limit(8)
    @best_kids      = KidsProduct.limit(8)
    @best_uniforms  = UniformProduct.limit(8)
    @best_others    = OtherProduct.limit(8)
  end
end
