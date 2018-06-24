class CreateGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.string :embed_url
      t.string :slug

      t.timestamps
    end
  end
end
