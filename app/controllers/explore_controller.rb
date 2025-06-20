class ExploreController < ApplicationController
  def index
    @tipo = params[:tipo]

    base_scope = case @tipo
                 when "ropa"
                   ClothingProduct
                 when "muebles"
                   FurnitureProduct
                 when "niños"
                   KidsProduct
                 when "uniformes"
                   UniformProduct
                 when "accesorios"
                   AccessoryProduct
                when "otros"
                  scope = OtherProduct.where(tipo: [nil, "otros"])
                  @talles_disponibles = scope.pluck(:talle_zapatilla).compact.uniq.sort
                  scope

                 else
                   Product.none
                 end

    @products = ::Filters::ProductFilterService.new(base_scope, params).call
  end

  def by_owner
    @owner = params[:owner]
    @products = Product.where(owner: @owner) # ⬅️ agregá esto
  end

  
  def owner_products
    @owner = params[:owner]
    @tipo = "caro"

    all_products = [
      ClothingProduct, KidsProduct, UniformProduct,
      FurnitureProduct, AccessoryProduct, OtherProduct
    ].flat_map { |klass| klass.where(owner: @owner) }

    @products = all_products

    # Filtros dinámicos
    @products = @products.select { |p| p.subtipo == params[:subtipo] } if params[:subtipo].present?
    @products = @products.select { |p| p.talle_ropa == params[:talle_ropa] } if params[:talle_ropa].present?
    @products = @products.select { |p| p.talle_zapatilla == params[:talle_zapatilla] } if params[:talle_zapatilla].present?
    @products = @products.select { |p| p.color == params[:color] } if params[:color].present?
    @products = @products.select { |p| p.precio.to_i <= params[:precio].to_i } if params[:precio].present?
    @products = @products.select { |p| p.distancia.to_f <= params[:distancia].to_f } if params[:distancia].present?

    # Subtipos únicos disponibles, dinámicos
    @subtipos_disponibles = all_products.map(&:subtipo).compact.uniq.sort

    render :index
  end


end
