class CreateMobilePhones < ActiveRecord::Migration
  def change
    create_table :mobile_phones do |t|
      t.string :number
      t.string :imei
      t.timestamps
    end
  end
end
