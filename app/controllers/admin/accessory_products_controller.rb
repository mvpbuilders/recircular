module Admin
  class AccessoryProductsController < Admin::ApplicationController
    def resource_class
      AccessoryProduct
    end
  end
end
