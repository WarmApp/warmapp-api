class TrackSerializer < ActiveModel::Serializer
  attributes :id, :playlist, :caption, :link, :source, :name, :fb_message,
    :fb_user_id, :fb_user_name
end
