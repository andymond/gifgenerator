class BaseController < ApplicationController
  before_action :logged_in?

  private

    def logged_in?
      unless current_user
        raise ActionController::RoutingError.new('Not Found')
      end
    end

end
