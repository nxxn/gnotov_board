class AddForeignKeyToAdPhotos < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :ad_photos, :ads
  end
end
