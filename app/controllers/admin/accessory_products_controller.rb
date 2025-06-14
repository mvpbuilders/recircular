# app/controllers/admin/accessory_products_controller.rb
module Admin
  class AccessoryProductsController < Admin::ApplicationController
    def resource_class
      AccessoryProduct
    end

    def update
      if params[:accessory_product][:images].blank? ||
         (params[:accessory_product][:images].size == 1 && params[:accessory_product][:images].first.blank?)
        params[:accessory_product].delete(:images)
      end

      resource = find_resource(params[:id])
      if resource.update(accessory_product_params)
        redirect_to admin_accessory_product_path(resource)
      else
        render :edit
      end
    end

    private

    def accessory_product_params
      params.require(:accessory_product).permit(
        :title,
        :description,
        :tipo,
        :subtipo,
        :uso,
        :color,
        :precio,
        :status,
        :tags,
        :owner,
        images: []
      )
    end
  end
end
