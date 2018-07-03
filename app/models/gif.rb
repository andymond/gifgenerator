class Gif < ApplicationRecord
  validates_uniqueness_of :embed_url, :slug
  has_many :user_gifs
end
