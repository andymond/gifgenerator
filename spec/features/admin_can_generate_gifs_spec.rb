require "rails_helper"

describe "admin can generate gifs" do
  it "allows user with admin role to add random gifs db" do
    user = create(:user, role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    fill_in "search_term", with: "cats"
    click_on "Generate new Gif!"

    expect(page).to have_content("Generated new Gif!")
    expect(current_path).to eq(gifs_path)
    expect(Gif.all.length).to eq(1)
    expect(page).to have_selector(".gif", count: 1)

    fill_in "search_term", with: "dogs"
    click_on "Generate new Gif!"

    expect(page).to have_content("Generated new Gif!")
    expect(current_path).to eq(gifs_path)
    expect(Gif.all.length).to eq(2)
    expect(page).to have_selector(".gif", count: 2)
  end
end
