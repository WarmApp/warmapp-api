class Facebook::Filters::YoutubeFilter < Facebook::Filters::BaseFilter
  def filter(feed)
    if feed[:caption].blank? or not feed[:caption].eql? 'youtube.com'
      true
    else
      false
    end
  end
end
