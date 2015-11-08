require 'ffaker'

FactoryGirl.define do
  factory :feed_without_caption, class: Facebook::Feed  do
    from id: Random.rand(12 ** 12), name: FFaker::Name.name
    id Random.rand(24 ** 24)
    message 'A feed without the caption key set'
    updated_time '2015-06-30T01:53:38+0000'
  end

  factory :youtube_feed_caption, class: Facebook::Feed  do
    from id: Random.rand(12 ** 12), name: FFaker::Name.name
    caption 'youtube.com'
    id Random.rand(24 ** 24)
    link 'https://www.youtube.com/watch?v=N0io9Uub_JM'
    source 'https://www.youtube.com/embed/N0io9Uub_JM?autoplay=1'
    name 'E O TCHAN - NA BOQUINHA DA GARRAFA'
    message 'An YouTube feed caption'
    updated_time '2015-06-30T01:53:38+0000'
  end

  factory :vimeo_feed_caption, class: Facebook::Feed  do
    from id: Random.rand(12 ** 12), name: FFaker::Name.name
    caption 'vimeo.com'
    id Random.rand(24 ** 24)
    link 'https://vimeo.com/119296951'
    source 'https://vimeo.com/119296951'
    name 'The Leap'
    message 'A vimeo feed caption'
    updated_time '2015-06-30T01:53:38+0000'
  end
end
