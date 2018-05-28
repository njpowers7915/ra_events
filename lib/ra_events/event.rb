class RaEvents::Event
  
  attr_accessor :name, :date, :city, :url, :venue, :ticket_url, :price, :min_age
  
  @@all = []
  
  def self.new_from_url(array) # will need url as argument
    #Will need to loop through all events on a page and create objects for each
    self.new(array[0], array[1], array[2])
  end
  
  def initialize(name, date, city)
    @name = name
    @date = date
    @city = city
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.reset
    @@all = []
  end
  
  def self.find(input)
    @@all[input - 1]
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