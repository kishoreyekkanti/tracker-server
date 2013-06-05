class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :driver_name
      t.string :mobile_number
      t.string :imei
      t.string :truck_registration_number
      t.timestamps
    end
  end
end
