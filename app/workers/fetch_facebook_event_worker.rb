class FetchFacebookEventWorker
  include Sidekiq::Worker

  def perform(event_id)
    repository = Facebook::EventRepository.new
    event = Facebook::Event.new(id: event_id)
    event.load!
    repository.cache!(event)
  end
end
