class Facebook::EventRepository
  def load!(event)
    if cached?(event)
      FetchFacebookEventWorker.perform_async(event.id)
      Facebook::Event.new(cache(event))
    else
      event.load!
      cache!(event)
      event
    end
  end

  def cache!(event)
    hash = JSON.parse(event.to_json, symbolize_names: true)
    data = hash.delete_if {
      |k, _| k == :fetcher || k == :graph
    }
    Rails.cache.write(cache_key(event), data, expires_in: 48.hours)
  end

private

  def cache_key(event)
    "facebook_event_#{event.id}"
  end

  def cached?(event)
    key = cache_key(event)
    Rails.cache.exist?(key) && Rails.cache.read(key).present?
  end

  def cache(event)
    Rails.cache.read(cache_key(event))
  end
end
