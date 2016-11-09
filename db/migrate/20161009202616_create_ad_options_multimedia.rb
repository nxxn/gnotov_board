class CreateAdOptionsMultimedia < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_multimedia_options do |t|

      t.integer :ad_id
      t.boolean :navigation, default: false
      t.boolean :aux, default: false
      t.boolean :usb, default: false
      t.boolean :bluetooth, default: false
      t.boolean :roof_rack, default: false
      t.boolean :tv, default: false
      t.boolean :media_for_backseats, default: false

    end
  end
end
