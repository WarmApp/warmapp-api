FactoryGirl.define do
  factory :track do
    playlist
    caption 'youtube.com'
    link 'https://youtu.be/eVD9j36Ke94'
    source 'https://www.youtube.com/embed/eVD9j36Ke94?autoplay=1'
    name FFaker::Lorem.sentence(3)
    fb_message FFaker::Lorem.sentence(10)
    fb_user_id { rand(1..999) }
    fb_user_name FFaker::Name.name
  end
end
