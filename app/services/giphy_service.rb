class GiphyService

  def initialize
    @conn = Faraday.new
  end

  def random(tag)
    url = "https://api.giphy.com/v1/gifs/random?api_key=#{ENV["giphy_api_key"]}&tag=#{tag}"
    get_url(url)
  end

  private

    def get_url(url)
      response = @conn.get(url)
      JSON.parse(response.body, symbolize_names: true)[:data]
    end

end
