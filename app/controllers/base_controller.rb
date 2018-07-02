class BaseController < ApplicationController
  before_action :user?

  private
    def user?
      unless current_user
        render status: 404
      end
    end
end
