class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.integer :mobile_phone_id
      t.timestamps
    end
  end
end
