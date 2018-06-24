require "rails_helper"

describe "Giphy Service" do
  it "gets random response from giphy api" do
    service = GiphyService.new
    results = service.random("cats")

    expect(results).to be_a(Hash)
  end
end
