class RemoveGearboxFromDrivingOptions < ActiveRecord::Migration[5.0]
  def change
    remove_column :ad_driving_options, :gearbox
  end
end
