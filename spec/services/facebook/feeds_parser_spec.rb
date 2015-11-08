require 'spec_helper'

describe Facebook::FeedsParser do
  it 'should parse feeds list successfully' do
    feeds = YAML::load_file("#{Rails.root}/spec/fixtures/facebook_event_feeds.yml")
    parser = Facebook::FeedsParser.new(feeds)
    parsed_feeds = parser.parse
    expect(parsed_feeds.length).to eql(2)
  end
end
