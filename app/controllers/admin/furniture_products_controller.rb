# app/controllers/admin/furniture_products_controller.rb
module Admin
  class FurnitureProductsController < Admin::ApplicationController
    def resource_class
      FurnitureProduct
    end

    def update
      # No eliminar imágenes si no se cargan nuevas
      if params[:furniture_product][:images].blank? ||
          (params[:furniture_product][:images].size == 1 && params[:furniture_product][:images].first.blank?)
        params[:furniture_product].delete(:images)
      end

      resource = find_resource(params[:id])
      if resource.update(furniture_product_params)
        redirect_to admin_furniture_product_path(resource)
      else
        render :edit
      end
    end

    private

    def furniture_product_params
      params.require(:furniture_product).permit(
        :title,
        :description,
        :tipo,
        :subtipo,
        :condition,
        :material,
        :color,
        :precio,
        :width,
        :height,
        :depth,
        :owner,
        :distancia,
        :status,
        :tags,
        :uso,
        images: []
      )
    end
  end
end
