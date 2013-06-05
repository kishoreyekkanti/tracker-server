class CreateMobilePhones < ActiveRecord::Migration
  def change
    create_table :mobile_phones do |t|
      t.string :number
      t.string :imei
      t.integer :tracker_id
      t.integer :truck_id
      t.timestamps
    end
  end
end
