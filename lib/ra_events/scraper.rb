class RaEvents::Scraper
  #Using EVENT_ARRAY as hardcoded test array.
  EVENT_ARRAY = [["name1", "date1", "city1"], ["name2", "date2", "city2"]]
  
# Scraper receives state name from CLI to convert into a url
  def state_url(state)
    date = Time.now.strftime("%Y-%m-%d")
    url = "https://www.residentadvisor.net/events/us/#{state}/month/#{date}"
  end
  
# Makes a method for get_page
  def get_page
    @get_page
  end
  
# Scraper scrapes for events from interpolated state url
# Returns list of event_urls to be scraped for details
  def scrape_events_by_state(url)
    @get_page = Nokogiri::HTML(open(url))
    self.get_page.css(#CSS GOES HERE)
  end
  
# Scraper scrapes for event details from event url
# Returns array of hashes to be made into Event objects
 # def scrape_event_details(event_list)
 #   event_list = scrape_events_by_state(url)
 #   event_list.each do |i|
 #     RaEvents::Event.new_from_state_page(i)
 #   end
    #return array of hashes
 # end
  
# Takes in array of hashes containing event details
# Returns array of event objects
  def make_events(state)
    state_url = state_url(state)
    event_list = scrape_for_events(state_url)
    hash_array = scrape_event_details(event_list)
    RaEvents::Event.new_from_hash
  end
    
    
 #   Takes an array of scraped events. For each event in the array, a new Event object is created.
  #  EVENT_ARRAY.each do |i|
  #    RaEvents::Event.new_from_url(i)
  #  end
  #end 

  
 # def state_url
 #  url = RaEvents::CLI.url_creator(state)
 #   Nokogiri::HTML(open(url))
#  end

  
  def self.find_event_url
    state_url = RaEvents::CLI.state_url
    Nokogiri::HTML(open("state_url"))

  
end