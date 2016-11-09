class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string     :name, default: ""
      t.boolean    :main, default: false

      t.timestamps
    end
  end
end
