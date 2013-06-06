class CreateGpsTrackers < ActiveRecord::Migration
  def change
    create_table :gps_trackers do |t|
      t.string :imei
      t.decimal :latitude
      t.decimal :longitude
      t.integer :tracker_id
      t.timestamps
    end
  end
end
