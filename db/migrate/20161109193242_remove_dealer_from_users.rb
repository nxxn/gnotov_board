class RemoveDealerFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :dealer_name, :string
    remove_column :users, :dealer_address, :string
    remove_column :users, :dealer_phone, :string
    remove_column :users, :dealer_description, :text
    remove_column :users, :dealer_logo_file_name, :string
    remove_column :users, :dealer_logo_content_type, :string
    remove_column :users, :dealer_logo_file_size, :integer
    remove_column :users, :dealer_logo_updated_at, :datetime
  end
end
