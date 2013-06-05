class CreateGpsTrackers < ActiveRecord::Migration
  def change
    create_table :gps_trackers do |t|
      t.string :imei
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
