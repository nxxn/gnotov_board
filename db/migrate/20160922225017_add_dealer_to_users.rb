class AddDealerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :dealer, :boolean, default: false
    add_column :users, :dealer_name, :string, default: ""
    add_column :users, :dealer_address, :string, default: ""
    add_column :users, :dealer_phone, :string, default: ""
    add_column :users, :dealer_description, :text, default: ""

    add_attachment :users, :dealer_logo
  end
end
