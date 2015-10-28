class Facebook::Fetcher
  attr_accessor :feeds, :metadata

  def initialize
    @feeds = []
    @metadata = nil

    fb = {
      id: FACEBOOK_CONFIG['app_id'],
      secret: FACEBOOK_CONFIG['app_secret']
    }
    @graph = Koala::Facebook::API.new(
        Koala::Facebook::OAuth.new(fb[:id], fb[:secret]).get_app_access_token)
  end

  def feed(id, is_recursive = true)
    begin
      results = @graph.get_object("#{id}/feed?fields=to,from,caption,id,link,source,name,message,created_time")
      parse_event_metadata(results)
      append_feeds(results)
      do_next_page_recursive(results) if is_recursive
    rescue Koala::Facebook::ClientError

    end

    @feeds
  end

  private

    def parse_event_metadata(feeds)
      unless feeds.empty?
        data = feeds[0]['to']['data'][0]
        @metadata = {id: data['id'], name: data['name']}
      end
    end

    def append_feeds(results)
      results.each do |result|
        result.delete('to') if result.has_key?('to')
        # todo: remove this responsability from here.. it's not a fetcher job
        # parse specific information from a kind of feed like youtube
        result['video_id'] = get_video_id_from_link(result['link'])
      end

      @feeds += results
    end

    def do_next_page_recursive(results)
      data = results.next_page
      unless data.empty?
        append_feeds(data)
        do_next_page_recursive(data)
      end
    end

    def get_video_id_from_link(link)
      regex = /^(?:http(?:s)?:\/\/)?(?:www\.)?(?:m\.)?(?:youtu\.be\/|youtube\.com\/(?:(?:watch)?\?(?:.*&)?v(?:i)?=|(?:embed|v|vi|user)\/))([^\?&\"'>]+)/
      regex.match(link).to_a[1]
    end
end