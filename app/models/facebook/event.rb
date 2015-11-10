class Facebook::Event
  include ActiveModel::Model
  include ActiveModel::SerializerSupport

  attr_accessor :id, :feeds, :metadata, :fetcher

  def load!
    self.fetcher = Facebook::Fetcher.new() if self.fetcher.nil?
    self.feeds = Facebook::FeedsParser.new(self.fetcher.feed(id)).parse
    self.metadata = fetcher.metadata
    self
  end
end
