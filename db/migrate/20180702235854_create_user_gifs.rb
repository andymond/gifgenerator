class CreateUserGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_gifs do |t|
      t.references :user, foreign_key: true
      t.references :gif, foreign_key: true

      t.timestamps
    end
  end
end
