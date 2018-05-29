class RaEvents::Event
  
  attr_accessor :name, :date, :city, :url, :venue, :price, :min_age
  
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
    @name ||= doc.css('header').css('h1')[0].text.strip
  end
  
  def date
    @date ||= doc.css('ul.clearfix').css('a')[0].text.strip
  end
  
  def city
    city_data ||= doc.css('ul.clearfix').css('li.wide').text
    if city_data.downcase.include?("tba")
      @city = "TBA"
    else
      @city = city_data.split(", ")[-2].strip
    end
  end
  
  #def website_url
  #  @website_url ||= doc.css('li.wide').css('a') #.text?
  #end
  
  def venue
    venue_data ||= doc.css('ul.clearfix').css('li.wide').css('a.cat-rev').text
    if venue_data.downcase.include?("tba") || venue_data == nil || self.city == "TBA"
      @venue = "TBA"
    else
      @venue = venue_data.strip
    end
  end
  
  def price
    price_data ||= doc.css('ul.clearfix').css('li')[2].text
    if price_data != nil
      @price = price_data.split("/")[-1].strip
    else
      @price = "???"
    end
    
  end
  
  def min_age
    age_data ||= doc.css('ul.clearfix').css('li')[3].text
    if age_data != nil
      @min_age = age_data.split("/")[-1].strip
    else
      @min_age = "N/A"
    end
  end
  
end