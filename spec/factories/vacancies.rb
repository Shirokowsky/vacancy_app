FactoryGirl.define do

  factory :vacancy do
    title Ryba::Company.name
    expired FFaker::Time.date
    salary FFaker::Address.building_number
    contact FFaker::PhoneNumber.short_phone_number
  end

end
