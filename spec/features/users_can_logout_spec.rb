require "rails_helper"

describe "All users can log out" do
  it "allows admin to logout" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit root_path

    click_on("Log out")

    expect(current_page).to have_content("Successfully logged out")
    expect(current_page).to_not have_content("Log out")

    visit user_path(admin)
    expect(response.status).to eq(404)
  end
end
