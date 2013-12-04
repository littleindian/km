class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :userid
      t.string :awardGiverName
      t.string :awardLink
      t.integer :accepted

      t.timestamps
    end
  end
end
