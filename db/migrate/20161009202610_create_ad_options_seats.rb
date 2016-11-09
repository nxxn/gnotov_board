class CreateAdOptionsSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_seats_options do |t|

      t.integer :ad_id
      t.boolean :heated_seats, default: false
      t.boolean :back_heated_seats, default: false
      t.boolean :ventilated_seats, default: false
      t.boolean :back_ventilated_seats, default: false
      t.boolean :massage_seats, default: false
      t.boolean :back_massage_seats, default: false
      t.boolean :memory_seats, default: false
      t.boolean :electric_seats, default: false
      t.boolean :sport_seats, default: false
      t.boolean :seven_seats, default: false
      t.string :seats_material, default: ""

    end
  end
end
