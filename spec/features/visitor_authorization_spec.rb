require "rails_helper"

describe "Visitors can only sign up or login" do
  it "renders 404s for views if user isn't logged in" do
    user = create(:user)

    expect {
      visit user_path(user)
    }.to raise_error(ActionController::RoutingError)

    expect {
      visit gifs_path
    }.to raise_error(ActionController::RoutingError)
  end
end
