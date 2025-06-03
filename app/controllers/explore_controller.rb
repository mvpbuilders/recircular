class ExploreController < ApplicationController
    def index
      @tipo = params[:tipo]

      base_scope = case @tipo
      when "ropa"
        ClothingProduct.all
      when "muebles"
        FurnitureProduct.all
      when "niños"
        KidsProduct.all
      when "uniformes"
        UniformProduct.all
      when "accesorios"
        AccessoryProduct.all
      when "otros"
        OtherProduct.all
      else
        Product.none
      end

      @products = ::Filters::ProductFilterService.new(base_scope, params).call
    end

  # 👇 NUEVO MÉTODO ACÁ ABAJO
  def by_owner
    @owner = params[:owner]
    @products = Product.where(owner: @owner)
  end

  def owner_products
    @owner = params[:owner]

    @kids_products = KidsProduct.where(owner: @owner)
    @uniform_products = UniformProduct.where(owner: @owner)
    @furniture_products = FurnitureProduct.where(owner: @owner)
    @accessory_products = AccessoryProduct.where(owner: @owner)
    @other_products = OtherProduct.where(owner: @owner)

    @all_products = @kids_products + @uniform_products + @furniture_products + @accessory_products + @other_products

    # Aplicar filtros
    @filtered_products = @all_products

    @filtered_products = @filtered_products.select { |p| p.tipo == params[:tipo] } if params[:tipo].present?
    @filtered_products = @filtered_products.select { |p| p.talle_ropa == params[:talle_ropa] } if params[:talle_ropa].present?
    @filtered_products = @filtered_products.select { |p| p.talle_zapatilla == params[:talle_zapatilla] } if params[:talle_zapatilla].present?
    @filtered_products = @filtered_products.select { |p| p.color == params[:color] } if params[:color].present?
    @filtered_products = @filtered_products.select { |p| p.precio.to_i <= params[:precio].to_i } if params[:precio].present?
    @filtered_products = @filtered_products.select { |p| p.distancia.to_f <= params[:distancia].to_f } if params[:distancia].present?
  end



end
