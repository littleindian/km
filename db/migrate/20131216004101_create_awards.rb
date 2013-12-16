class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :user_id
      t.string :award_giver_name
      t.string :award_link
      t.integer :accepted

      t.timestamps
    end
  end
end
