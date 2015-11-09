FactoryGirl.define do
  factory :playlist do
    name FFaker::Lorem.sentence(3)
    fb_event_id { rand(1..999) }
  end
end
