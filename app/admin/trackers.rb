ActiveAdmin.register Tracker do
  form do |f|
    f.inputs "Tracker Details" do
      f.input :latitude, :label => "Latitude"
      f.input :longitude, :label => "Longitude"
      f.input :mobile_phone, :as => :select, :collection => MobilePhone.all
    end
    f.actions
  end
end
