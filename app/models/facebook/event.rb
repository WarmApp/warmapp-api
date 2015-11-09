class Facebook::Event
  include ActiveModel::Model
  include ActiveModel::SerializerSupport

  attr_accessor :id, :feeds, :metadata, :fetcher

  def initialize(args = nil)
    super
    fetcher = nil
  end

  def persisted
    false
  end

  def load!
    self.fetcher = Facebook::Fetcher.new() if self.fetcher.nil?
    parser = Facebook::FeedsParser.new(self.fetcher.feed(id))
    self.feeds = parse
    self.metadata = fetcher.metadata
    self
  end

private

  def parse
    parser = Facebook::FeedsParser.new(self.fetcher.feed(id))
    parser.parse
  end
end
