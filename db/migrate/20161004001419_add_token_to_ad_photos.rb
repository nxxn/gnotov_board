class AddTokenToAdPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :ad_photos, :token, :string, default: ""
  end
end
