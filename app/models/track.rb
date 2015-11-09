class Track < ActiveRecord::Base
  belongs_to :playlist

  validates :name, presence: true
  validates :link, presence: true
  validates :source, presence: true
  validates :caption, presence: true
end
