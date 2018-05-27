class RaEvents::Event
  
  attr_accessor :name, :date, :city, :url, :venue, :ticket_url, :cost, :min_age
  
  @@all = []
  
  def initialize
    @@all << self
  end
  
  def name
  end
  
  def date
  end
  
  def city
  end
  
  def url
  end
  
  def venue
  end
  
  def ticket_url
  end
  
  def cost
  end
  
  def min_age
  end
  
end