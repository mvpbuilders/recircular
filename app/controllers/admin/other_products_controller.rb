# app/controllers/admin/other_products_controller.rb
module Admin
  class OtherProductsController < Admin::ApplicationController
    def resource_class
      OtherProduct
    end

    def update
      # No eliminar imágenes si no se cargan nuevas
      if params[:other_product][:images].blank? ||
          (params[:other_product][:images].size == 1 && params[:other_product][:images].first.blank?)
        params[:other_product].delete(:images)
      end

      resource = find_resource(params[:id])
      if resource.update(other_product_params)
        redirect_to admin_other_product_path(resource)
      else
        render :edit
      end
    end

    private

    def other_product_params
      params.require(:other_product).permit(
        :title,
        :description,
        :tipo,
        :subtipo,
        :talle_ropa,
        :talle_zapatilla,
        :precio,
        :distancia,
        :status,
        :tags,
        :condition,
        :owner,
        images: []
      )
    end
  end
end
