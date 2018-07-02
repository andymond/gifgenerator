require "rails_helper"

describe "All users can log out" do
  it "allows admin to logout" do
    admin = create(:user, role: 1)
    visit root_path
    click_on "Log in"

    fill_in "email", with: admin.email
    fill_in "password", with: admin.password

    click_on("Log in")
    click_on("Log out")

    expect(page).to have_content("Logged out! Smell ya later, #{admin.name}")
    expect(page).to_not have_content("Log out")

    expect {
      visit user_path(admin)
    }.to raise_error(ActionController::RoutingError)
  end

  it "allows user to logout" do
    user = create(:user, role: 0)
    visit root_path
    click_on "Log in"

    fill_in "email", with: user.email
    fill_in "password", with: user.password

    click_on("Log in")
    click_on("Log out")

    expect(page).to have_content("Logged out! Smell ya later, #{user.name}")
    expect(page).to_not have_content("Log out")

    expect {
      visit user_path(user)
    }.to raise_error(ActionController::RoutingError)
  end
end
