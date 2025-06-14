class ExploreController < ApplicationController
  def index
    @tipo = params[:tipo]

    base_scope = case @tipo
                 when "ropa"
                   ClothingProduct.where(available: true)
                 when "muebles"
                   FurnitureProduct.where(available: true)
                 when "niños"
                   KidsProduct.where(available: true)
                 when "uniformes"
                   UniformProduct.where(available: true)
                 when "accesorios"
                   AccessoryProduct.where(available: true)
                 when "otros"
                   OtherProduct.where(tipo: [nil, "otros"], available: true)
                 else
                   Product.none
                 end

    @products = ::Filters::ProductFilterService.new(base_scope, params).call
  end

  def by_owner
    @owner = params[:owner]
    @products = Product.where(owner: @owner)
  end

  def owner_products
    @owner = params[:owner]
    @tipo = "caro"

    all_products = [
      ClothingProduct, KidsProduct, UniformProduct,
      FurnitureProduct, AccessoryProduct, OtherProduct
    ].flat_map { |klass| klass.where(owner: @owner) }

    @products = all_products
    @products = @products.select { |p| p.tipo == params[:tipo] } if params[:tipo].present?
    @products = @products.select { |p| p.talle_ropa == params[:talle_ropa] } if params[:talle_ropa].present?
    @products = @products.select { |p| p.talle_zapatilla == params[:talle_zapatilla] } if params[:talle_zapatilla].present?
    @products = @products.select { |p| p.color == params[:color] } if params[:color].present?
    @products = @products.select { |p| p.precio.to_i <= params[:precio].to_i } if params[:precio].present?
    @products = @products.select { |p| p.distancia.to_f <= params[:distancia].to_f } if params[:distancia].present?

    render :index
  end
end
