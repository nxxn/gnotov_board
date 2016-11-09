class CreateAdPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_photos do |t|
      t.integer :ad_id
      t.attachment :image

      t.timestamps
    end
  end
end
