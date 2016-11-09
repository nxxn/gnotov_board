class CreateAdOptionsSteering < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_steering_options do |t|

      t.integer :ad_id
      t.boolean :heated_st_wheel, default: false
      t.boolean :electric_st_wheel, default: false
      t.boolean :regulated_st_wheel, default: false
      t.boolean :multi_st_wheel, default: false
      t.boolean :memory_st_wheel, default: false
      t.boolean :wood_st_wheel, default: false

    end
  end
end
