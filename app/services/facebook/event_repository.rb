class Facebook::EventRepository
  def load!(event)
    if cached?(event)
      # TODO(wcalderie) refactor the event poro to act more like a model
      data = cache(event)
      data.delete(:fetcher)
      data.delete(:graph)
      data.delete(:id)
      data
    else
      event.load!
      cache!(event)
      event
    end
  end

private

  def cache_key(event)
    "facebook_event_#{event.id}"
  end

  def cached?(event)
    key = cache_key(event)
    Rails.cache.exist?(key) && Rails.cache.read(key).present?
  end

  def cache!(event)
    Rails.cache.write(cache_key(event), event.to_json)
  end

  def cache(event)
    JSON.parse(Rails.cache.read(cache_key(event)), symbolize_names: true)
  end
end
