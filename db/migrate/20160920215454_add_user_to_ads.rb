class AddUserToAds < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :user_id, :integer
  end
end
