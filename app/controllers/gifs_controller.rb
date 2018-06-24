class GifsController < ApplicationController
  before_action :admin?, only: [:create]

  def create
    conn = Faraday.new
    url = "https://api.giphy.com/v1/gifs/random?api_key=#{ENV["giphy_api_key"]}&tag=#{params[:search_term]}"
    response = conn.get(url)
    results = JSON.parse(response.body, symbolize_names: true)[:data]
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
      current_admin
    end

end
