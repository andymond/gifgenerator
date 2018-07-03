require 'rails_helper'

RSpec.describe Gif, type: :model do
  it {should validate_uniqueness_of(:embed_url)}
  it {should validate_uniqueness_of(:slug)}
  it {should have_many(:user_gifs)}
end
