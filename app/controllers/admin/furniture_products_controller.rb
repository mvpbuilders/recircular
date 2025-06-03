# app/controllers/admin/furniture_products_controller.rb
module Admin
  class FurnitureProductsController < Admin::ApplicationController
    def resource_class
      FurnitureProduct
    end
  end
end
