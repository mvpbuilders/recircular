module Admin
  class ProductsController < Admin::ApplicationController
    def scoped_resource
      super.order(id: :asc)
    end
  end
end
