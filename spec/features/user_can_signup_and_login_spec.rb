require 'rails_helper'

describe "user can sign up" do
  it "allows unregistered user to create account" do
    visit root_path

    fill_in ".name", with: "coffeeman"
    fill_in ".email", with: "beans@beans.com"
    fill_in ".password", with: "unbreakablepassword"

    click_on "Create Account"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Account Successfully Created.")
  end
end
