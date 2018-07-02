class GifsController < ApplicationController
  before_action :admin?, only: [:create]

  def create
    results = GiphyService.new.random(params[:search_term])
    gif = Gif.new(slug: results[:slug], embed_url: results[:embed_url])
    if gif.save
      flash[:notice] = "Generated new Gif!"
      redirect_to gifs_path
    else
      flash[:error] = "Something went TERRIBLY wrong!"
      redirect_to root_path
    end
  end

  def index
    @gifs = Gif.all
  end

  private

    def admin?
      unless current_admin
        render status: 404
      end
    end

end
