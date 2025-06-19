module Admin
  class OrdersController < Admin::ApplicationController
    def scoped_resource
      super.order(id: :desc)
    end
    
    def index
      redirect_to paid_admin_orders_path
    end


    def pending
      resources = scoped_resource.where(status: "pending").page(params[:_page])
      render :index, locals: {
        resources: resources,
        search_term: nil,
        page: Administrate::Page::Collection.new(dashboard, order: nil),
        show_search_bar: false
      }
    end

    def paid
      resources = scoped_resource.where(status: "paid").page(params[:_page])
      render :index, locals: {
        resources: resources,
        search_term: nil,
        page: Administrate::Page::Collection.new(dashboard, order: nil),
        show_search_bar: false
      }
    end

  end
end
