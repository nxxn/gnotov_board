class CreateAdExtras < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_extras do |t|
      t.integer :ad_id
      
      t.boolean :bold_border
      t.boolean :be_on_top
      t.boolean :be_on_top_of_search
      t.boolean :special_block
      t.boolean :be_on_home
      t.boolean :luxury_position
      t.boolean :urgently

      t.timestamps
    end
  end
end
