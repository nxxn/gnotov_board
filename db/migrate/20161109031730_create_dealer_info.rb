class CreateDealerInfo < ActiveRecord::Migration[5.0]
  def change
    create_table :dealer_infos do |t|
      t.integer :user_id

      t.string :dealer_name
      t.string :dealer_address
      t.string :dealer_phone
      t.text :dealer_description
      t.attachment :dealer_logo

      t.timestamps
    end
  end
end
