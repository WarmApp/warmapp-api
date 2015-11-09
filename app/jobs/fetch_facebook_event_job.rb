class FetchFacebookEventJob < ActiveJob::Base
  queue_as :fb_event_fetch

  def perform(event_id)
    repository = Facebook::EventRepository.new
    # repository.cache!(event)
    puts "vish man"
  end
end
