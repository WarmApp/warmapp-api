class Facebook::Event
  include ActiveModel::SerializerSupport

  attr_accessor :id, :feeds, :metadata

  def initialize(id, fetcher = nil)
    @id = id
    @feeds = []
    @metadata = {}
    @fetcher = fetcher
  end

  def feed
    parser = Facebook::FeedsParser.new(@fetcher.feed(@id))
    @feeds = parser.parse
    @feeds
  end

  def metadata
    @metadata = @fetcher.metadata
  end

  def load!
    @fetcher = Facebook::Fetcher.new() if @fetcher.nil?
    self.feed
    self.metadata
    self
  end
end
