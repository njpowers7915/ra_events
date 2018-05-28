class RaEvents::Event
  
  attr_accessor :name, :date, :city, :url, :venue, :ticket_url, :price, :min_age
  
  @@all = []
  
  
  def self.new_from_state_url(state_url)
    self.new(
      state_url.#<CSS GOES HERE>
      )
  end
  
#Initialize with event's url only. Will scrape remaining details from this url
  def initialize(url=nil)
    @url = url
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find(input)
    @@all[input - 1]
  end
  
  def self.reset
    @@all = []
  end
  
#Allows Scraper to access specific event's HTML
  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
  
  def name
    @name
  end
  
  def city
    @city
  end
  
  def url
    @url
  end
  
  def venue
    @venue
  end
  
  def ticket_url
    @ticket_url
  end
  
  def price
    @price
  end
  
  def min_age
    @min_age
  end
  
end