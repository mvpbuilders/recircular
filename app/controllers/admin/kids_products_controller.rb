# app/controllers/admin/kids_products_controller.rb
module Admin
  class KidsProductsController < Admin::ApplicationController
    def resource_class
      KidsProduct
    end

    def update
      # No eliminar imágenes si no se cargan nuevas
      if params[:kids_product][:images].blank? ||
          (params[:kids_product][:images].size == 1 && params[:kids_product][:images].first.blank?)
        params[:kids_product].delete(:images)
      end

      resource = find_resource(params[:id])
      if resource.update(kids_product_params)
        redirect_to admin_kids_product_path(resource)
      else
        render :edit
      end
    end

    private

    def kids_product_params
      params.require(:kids_product).permit(
        :title,
        :description,
        :tipo,
        :subtipo,
        :edad,
        :talle_ropa,
        :talle_zapatilla,
        :precio,
        :condition,
        :distancia,
        :status,
        :tags,
        :owner,
        images: []
      )
    end
  end
end
