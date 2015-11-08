require 'spec_helper'

describe Facebook::Filters::YoutubeFilter do

  let(:filter) { Facebook::Filters::YoutubeFilter.new }

  it 'should return true if feed caption is blank' do
    feed = FactoryGirl.attributes_for(:feed_without_caption)
    expect(filter.filter(feed)).to be_truthy
  end

  it 'should return true if feed caption is not equal to youtube.com' do
    feed = FactoryGirl.attributes_for(:vimeo_feed_caption)
    expect(filter.filter(feed)).to be_truthy
  end

  it 'should return false if feed caption is equal to youtube.com' do
    feed = FactoryGirl.attributes_for(:youtube_feed_caption)
    expect(filter.filter(feed)).to be_falsey
  end
end
