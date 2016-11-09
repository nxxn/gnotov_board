class CreateFavoriteAds < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_ads do |t|
      t.integer :user_id
      t.integer :ad_id

      t.timestamps
    end
  end
end
