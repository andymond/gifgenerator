require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name)}
  it {should validate_presence_of(:email)}
  it {should validate_uniqueness_of(:email)}
  it {should validate_presence_of(:password)}
  it {should define_enum_for(:role).with([:admin, :user])}
  it "should have default role of user" do
    user = User.create(name: "dog", email: "bacon@baconmail.com", password: "password")

    expect(user.role).to eq("user")
  end
  it {should have_many(:user_gifs)}
end
