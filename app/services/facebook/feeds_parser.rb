class Facebook::FeedsParser
  attr_accessor :feeds

  def initialize(feeds = [])
    @feeds = feeds
    @filters = { youtube: Facebook::Filters::YoutubeFilter.new() }
  end

  def parse
    @feeds.delete_if { |feed| apply_filters(feed)}
  end

  private

  def apply_filters(feed)
    feed = feed.with_indifferent_access
    @filters[:youtube].filter(feed)
  end
end
