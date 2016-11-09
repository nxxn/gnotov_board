class AddActiveToAds < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :active, :boolean, default: false
    add_column :ads, :paid, :boolean, default: false
  end
end
