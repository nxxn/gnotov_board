class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.string :title, default: ""
      t.string :phone, default: ""
      t.string :phone_additional, default: ""
      t.string :price, default: ""
      t.string :email, default: ""
      t.string :website, default: ""
      t.text   :description, default: ""

      t.timestamps
    end
  end
end
