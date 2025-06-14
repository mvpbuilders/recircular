module Admin
  class ClothingProductsController < Admin::ApplicationController
    def resource_class
      ClothingProduct
    end

    def update
      # No eliminar imágenes si no se cargan nuevas
      if params[:clothing_product][:images].blank? ||
          (params[:clothing_product][:images].size == 1 && params[:clothing_product][:images].first.blank?)
        params[:clothing_product].delete(:images)
      end

      resource = find_resource(params[:id])
      if resource.update(clothing_product_params)
        redirect_to admin_clothing_product_path(resource)
      else
        render :edit
      end
    end

    private

    def clothing_product_params
      params.require(:clothing_product).permit(
        :title,
        :description,
        :tipo,
        :subtipo,
        :condition,
        :color,
        :talle_ropa,
        :talle_zapatilla,
        :precio,
        :genero,
        :status,
        :owner,
        :distancia,
        :tags,
        :uso,
        images: []
      )
    end
  end
end
