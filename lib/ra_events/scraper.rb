class RaEvents::Scraper
  #Using EVENT_ARRAY as hardcoded test array.
  EVENT_ARRAY = []
  
  def make_events
    #Takes an array of scraped events. For each event in the array, a new Event object is created.
    EVENT_ARRAY.each do |i|
      RaEvents::Event.new_from_url
    end
  end
  
end