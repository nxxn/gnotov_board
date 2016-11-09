class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string     :first_name, default: ""
      t.string     :last_name, default: ""
      t.string     :phone, default: ""
      t.attachment :avatar
      t.boolean    :admin, default: false

      t.timestamps
    end
  end
end
