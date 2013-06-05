class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :registration_number
      t.string :driver_name
      t.integer :mobile_phone_id
      t.timestamps
    end
  end
end
