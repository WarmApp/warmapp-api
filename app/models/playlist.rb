class Playlist < ActiveRecord::Base
  has_many :tracks

  validates :name, presence: true
  validates :fb_event_id, presence: true
end
