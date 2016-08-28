FactoryGirl.define do
  factory :enabled_city do
    name "Porto Alegre"
    center_lat 30.0347
    center_lgt 51.2177
    radius 50000
  end

  factory :vehicle_type do
    name "taxi"
  end

  factory :vehicle do
    enabled_city
    vehicle_type
  end
end
