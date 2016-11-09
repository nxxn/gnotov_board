class CreateAdIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_issues do |t|
      t.integer :user_id
      t.integer :ad_id
      t.string  :reason

      t.timestamps
    end
  end
end
