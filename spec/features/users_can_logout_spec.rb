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

    expect(page).to have_content("Logged out! Smell ya later, User1")
    expect(page).to_not have_content("Log out")

    visit user_path(admin)
    expect(page.status_code).to eq(404)
  end
end
