class RaEvents::Event
  
  attr_accessor :name, :date, :city, :url, :venue, :ticket_url, :price, :min_age
  
  @@all = []
  
  
  def self.new_from_state_url(i)
    self.new(
      "https://www.residentadvisor.net#{i}"
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
    @name ||= doc.css('') #.text?
  end
  
  def city
    @city ||= doc.css('') #.text?
  end
  
  def website_url
    @website_url ||= doc.css('') #.text?
  end
  
  def venue
    @venue ||= doc.css('') #.text?
  end
  
  def ticket_url
    @ticket_url ||= doc.css('') #.text?
  end
  
  def price
    @price ||= doc.css('') #.text?
  end
  
  def min_age
    @min_age ||= doc.css('') #.text?
  end
  
end