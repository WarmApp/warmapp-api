class Facebook::Event
  attr_accessor :no_cache

  def initialize(id, fetcher = nil)
    @id = id
    @feeds = []
    @metadata = {}
    @fetcher = fetcher
    @no_cache = false
  end

  def feeds
    if has_cache? && !@no_cache
      get_cache('feeds')
    else
      @fetcher = Facebook::Fetcher.new() if @fetcher.nil?
      parser = Facebook::FeedsParser.new(@fetcher.feed(@id))
      @feeds = parser.parse
      set_cache
      @feeds
    end
  end

  def metadata
    @fetcher = Facebook::Fetcher.new() if @fetcher.nil?
    @metadata = @fetcher.metadata
  end

private

  def has_cache?
    # if Feature.active?(:redis)
    #   Rails.cache.exist? "event_feeds_#{@id}" && 
    #     Rails.cache.read("event_feeds_#{@id}").present?
    # else
    #   false
    # end

    false
  end

  def set_cache
    # if Feature.active?(:redis)
    #   Rails.cache.write("event_feeds_#{@id}", @feeds)
    #   Rails.cache.write("event_metadata_#{@id}", @metadata)
    # end
  end

  def get_cache(key)
    Rails.cache.read("event_#{key}_#{@id}")
  end
end
