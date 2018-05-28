class RaEvents::Scraper
  #Using EVENT_ARRAY as hardcoded test array.
  EVENT_ARRAY = [["name1", "date1", "city1"], ["name2", "date2", "city2"]]
  
 # def get_page
#    url = RaEvents::CLI.url_creator(state)
 #   Nokogiri::HTML(open(url))
#  end
  
  def make_events
    #Takes an array of scraped events. For each event in the array, a new Event object is created.
    EVENT_ARRAY.each do |i|
      RaEvents::Event.new_from_url
    end
  end
  
end