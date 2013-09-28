require 'faker'
FactoryGirl.define do
  factory :place do
    name Faker::Company.name
    address Faker::Address.street_address
  end
  factory :tag do
    tag Faker::Name.first_name
  end
  factory :event do
    name Faker::Name.name
    date Time.now()
    body Faker::Lorem.paragraph        
    place FactoryGirl.create(:place)
    tags {
      Array(1..5).sample.times.map do
        FactoryGirl.create(:tag)
      end
    }
  end

end