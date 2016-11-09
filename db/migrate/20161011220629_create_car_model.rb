class CreateCarModel < ActiveRecord::Migration[5.0]
  def change
    create_table :car_models do |t|
      t.integer :car_make_id
      t.string  :name
    end
  end
end
