FactoryGirl.define do

  factory :employee do
    name Ryba::Name.full_name
    contact FFaker::PhoneNumber.short_phone_number
    salary FFaker::Address.building_number
    status true
  end

end
