class CreateAdTechSpecs < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_tech_specs do |t|

      t.integer :ad_id

      t.integer  :mileage
      t.integer  :built_year
      t.integer  :built_month
      t.integer  :inspection_year
      t.integer  :inspection_month
      t.integer  :power
      t.float    :engine_cc
      t.boolean  :new_car
      t.string   :vin_number
      t.string   :color
      t.string   :body_type
      t.string   :engine_type


    end
  end
end
