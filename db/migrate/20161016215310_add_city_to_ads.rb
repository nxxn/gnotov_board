class AddCityToAds < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :country, :string, default: ""
    add_column :ads, :city, :string, default: ""
  end
end
