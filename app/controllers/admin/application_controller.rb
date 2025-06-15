module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin_user!

    def current_user
      current_admin_user
    end
  end
end
