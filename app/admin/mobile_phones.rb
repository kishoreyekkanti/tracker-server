ActiveAdmin.register MobilePhone do

  form do |f|
    f.inputs "Mobile Phone Details" do
      f.input :number, :label => "Mobile phone number"
      f.input :imei, :label => "IMEI Number"
    end
    f.actions
  end
end
