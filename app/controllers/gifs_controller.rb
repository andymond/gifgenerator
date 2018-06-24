class GifsController < ApplicationController
  before_action :admin?, only: [:create]

  def create
    flash[:notice] = "Generated new Gif!"
    redirect_to gifs_path
  end

  def index
    @gifs = Gif.all
  end

  private

    def admin?
      current_admin
    end

end
