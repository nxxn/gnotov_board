class CreateAdOptionsSafety < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_safety_options do |t|

      t.integer :ad_id
      t.boolean :lane_warning, default: false
      t.boolean :sign_recognition, default: false
      t.boolean :traction_control, default: false
      t.boolean :parktronic_back, default: false
      t.boolean :parktronic_front, default: false
      t.boolean :blind_spot_monitor, default: false
      t.boolean :collision_avoidance, default: false
      t.boolean :backup_camera, default: false
      t.boolean :surround_camera, default: false
      t.boolean :auto_parking, default: false
      t.boolean :night_vision, default: false

    end
  end
end
