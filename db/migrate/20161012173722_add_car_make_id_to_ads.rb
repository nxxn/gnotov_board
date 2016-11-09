class AddCarMakeIdToAds < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :car_make_id, :integer
    add_column :ads, :car_model_id, :integer
  end
end
