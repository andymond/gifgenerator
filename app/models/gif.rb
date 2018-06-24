class Gif < ApplicationRecord
  validates_uniqueness_of :embed_url, :slug
end
