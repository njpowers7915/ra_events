class RaEvents::Scraper
  #Using EVENT_ARRAY as hardcoded test array.
  EVENT_ARRAY = [["name1", "date1", "city1"], ["name2", "date2", "city2"]]
  
 # def state_url
#    url = RaEvents::CLI.url_creator(state)
 #   Nokogiri::HTML(open(url))
#  end

  def event_url
    
  
  def self.find_event_url
    state_url = RaEvents::CLI.state_url
    Nokogiri::HTML(open("state_url"))
  
  
  def make_events
    #Takes an array of scraped events. For each event in the array, a new Event object is created.
    EVENT_ARRAY.each do |i|
      RaEvents::Event.new_from_url(i)
    end
  end
  
end