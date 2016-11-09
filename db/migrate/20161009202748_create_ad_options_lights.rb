class CreateAdOptionsLights < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_lights_options do |t|

      t.integer :ad_id
      t.boolean :xenon_lights, default: false
      t.boolean :bixenon_lights, default: false
      t.boolean :led_lights, default: false
      t.boolean :laser_lights, default: false
      t.boolean :adaptive_lights, default: false
      t.boolean :fog_lights, default: false
      t.boolean :daytime_lights, default: false

    end
  end
end
