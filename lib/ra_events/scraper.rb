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
    event_list = []
    self.get_page.css("h1.event-title").each do |i|
      event_url = i.css("a").attribute("href").value
      event_list << event_url
    end
    event_list
  end

# Initializes Event object with a unique url
# Returns array of event objects
  def make_events(state)
    state_url = state_url(state)
    event_list = scrape_events_by_state(state_url)
    event_list.each do |i|
      RaEvents::Event.new_from_state_url(i)
    end
  end
end
