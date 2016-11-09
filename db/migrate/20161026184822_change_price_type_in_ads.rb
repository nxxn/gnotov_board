class ChangePriceTypeInAds < ActiveRecord::Migration[5.0]
  def change
    remove_column :ads, :price, :string
    add_column :ads, :price, :float, default: 0
  end
end
