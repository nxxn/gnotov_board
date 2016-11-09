class CreateAdOptionsComfort < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_comfort_options do |t|

      t.integer :ad_id
      t.boolean :headup_display, default: false
      t.boolean :rain_sensor, default: false
      t.boolean :self_steering, default: false
      t.boolean :webasto, default: false
      t.boolean :keyless_entry, default: false
      t.boolean :softclose, default: false
      t.boolean :electric_windows, default: false
      t.boolean :electric_mirrors, default: false
      t.boolean :electric_trunk, default: false
      t.boolean :anti_dazzle_mirrors, default: false
      t.boolean :air_suspension, default: false
      t.boolean :air_conditioning, default: false
      t.boolean :auto_climate, default: false
      t.boolean :sunroof, default: false
      t.boolean :panoramic_roof, default: false
      t.boolean :isofix, default: false
      t.boolean :second_wheels, default: false
      t.boolean :tow_bar, default: false

    end
  end
end
