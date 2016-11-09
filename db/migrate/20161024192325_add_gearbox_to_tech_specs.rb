class AddGearboxToTechSpecs < ActiveRecord::Migration[5.0]
  def change
    add_column :ad_tech_specs, :gearbox, :string, default: ""
  end
end
