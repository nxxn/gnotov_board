class CreateAdOptionsDriving < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_driving_options do |t|

      t.integer :ad_id
      t.string :gearbox, default: ""
      t.boolean :four_wheel_drive, default: false
      t.boolean :cruise_control, default: false
      t.boolean :adaptive_cruise_control, default: false
      t.boolean :spare_wheel, default: false
      t.boolean :tire_pressure, default: false
      t.boolean :start_stop, default: false

    end
  end
end
