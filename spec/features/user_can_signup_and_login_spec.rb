require 'rails_helper'

describe "user can sign up" do
  it "allows unregistered user to create account" do
    visit root_path

    fill_in "user_name", with: "coffeeman"
    fill_in "user_email", with: "beans@beans.com"
    fill_in "user_password", with: "unbreakablepassword"

    click_on "Create Account"

    user = User.find_by(name: 'coffeeman')

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Account Successfully Created.")
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end
end

describe "user can log in" do
  it "allows existing user to log in" do
    user = create(:user)

    visit root_path

    click_on "Log in"

    expect(current_path).to eq(new_session_path)

    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_on "Log in"

    expect(current_path).to eq(dashboard_path)
  end
end
