# app/controllers/admin/uniform_products_controller.rb
module Admin
  class UniformProductsController < Admin::ApplicationController
    def resource_class
      UniformProduct
    end

    def update
      if params[:uniform_product][:images].blank? ||
         (params[:uniform_product][:images].size == 1 && params[:uniform_product][:images].first.blank?)
        params[:uniform_product].delete(:images)
      end

      resource = find_resource(params[:id])
      if resource.update(uniform_product_params)
        redirect_to admin_uniform_product_path(resource)
      else
        render :edit
      end
    end

    private

    def uniform_product_params
      params.require(:uniform_product).permit(
        :title,
        :description,
        :tipo,
        :subtipo,
        :colegio,
        :talle_ropa,
        :precio,
        :distancia,
        :status,
        :tags,
        :owner,
        images: []
      )
    end
  end
end
