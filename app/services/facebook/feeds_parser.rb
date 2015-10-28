class Facebook::FeedsParser
    attr_accessor :feeds

    def initialize(feeds = [])
      @feeds = feeds
      @filters = { youtube: Facebook::Filters::YoutubeFilter.new() }
    end

    def parse
      @feeds.each {
        |feed| @feeds.delete_if {
          |f| apply_filters(f)
        }
      }

      @feeds
    end

  private

    def apply_filters(feed)
      feed = feed.with_indifferent_access
      @filters[:youtube].filter(feed)
    end
end
