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
