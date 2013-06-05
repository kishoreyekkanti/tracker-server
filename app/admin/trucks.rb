ActiveAdmin.register Truck do
  form do |f|
    f.inputs "Truck Details" do
      f.input :driver_name
      f.input :registration_number
      f.input :mobile_phone, :as => :select, :collection => MobilePhone.all.map{|mobile|[mobile.number, mobile.id]}, :name => :mobile_phone
    end
    f.actions
  end

end
