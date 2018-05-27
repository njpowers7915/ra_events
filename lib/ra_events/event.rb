class RaEvents::Event
  
  attr_accessor :name, :date, :city, :url, :venue, :ticket_url, :cost, :min_age
  
  @@all = []
  
  def self.new_from_url # will need url as argument
    self.new("Event name", "Event Date", "City")
  
  def initialize(name=nil, date=nil, city=nil)
    @name = name
    @date = date
    @city = city
    @@all << self
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
  
  def cost
    @cost
  end
  
  def min_age
    @min_age
  end
  
end