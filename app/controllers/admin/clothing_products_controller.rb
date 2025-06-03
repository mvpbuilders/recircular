module Admin
  class ClothingProductsController < Admin::ApplicationController
    def resource_class
      ClothingProduct
    end
  end
end