module Admin
  class OrdersController < Admin::ApplicationController
    def scoped_resource
      super.order(id: :desc)
    end
  end
end
