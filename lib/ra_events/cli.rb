require 'pry'

class RaEvents::CLI
  @event = nil
  
  def call
    puts
    puts "Welcome to the Resident Advisor Event Finder!"
    puts
    sleep(2)
    #puts "Overview of basic commands eg quit, new_state, etc..."
    puts
    start
  end
  
  def start
    search_by_state
    select_event
    option_menu
  end
  
  def search_by_state
    puts "Please enter the name of the state where you would like to see a show: "
    input = gets.strip.downcase.gsub(/\s+/, "")
    if valid_state?(input) == false
      puts "Invalid state name"
      sleep(1)
      puts
      search_by_state
    else
      state = input
      event_list(state)
    #if input is a valid state name, then method will return event_list
    #if input is not valid, user will be asked to try again
    end
  end
  
  def url_creator(input)
    state = input.downcase.gsub(/\s+/, "")
    date = Time.now.strftime("%Y-%m-%d")
    url = "https://www.residentadvisor.net/events/us/#{state}/month/#{date}"
  end
  
  def valid_state?(input)
    # True if valid url can be made from input
    # Need to make a special step for "Washington". URL's on RA website are "washingtondc" or "washingtonstate"
    true
  end
  
  def event_list(state)
    #list of events in a particular state
    #Will plug state into a URL and send that off to Scraper
    #Scraper will return results
    #Event.new_from_url will need url argument
    RaEvents::Scraper.new.make_events
    RaEvents::Event.all.each do |i|
      puts "1. #{i.name} -- #{i.date} -- #{i.city}"
    end
    #@event = RaEvents::Event.new_from_url
    #puts "1. #{@event.name} -- #{@event.date} -- #{@event.city}"
    #puts "2. event_name_1 -- date_1 -- city_1"
    #puts "3. event_name_1 -- date_1 -- city_1"
  end
  
  def select_event
    puts "Please enter event number"
    input = gets.strip
    if valid_number?(input) == false
      puts "Invalid number"
      sleep(1)
      puts
      select_event
    else
      event_details(input)
    #if input is valid, then method will return event_details
    #if input is not valid, user will be asked to try again
    end
  end
  
  def valid_number?(input)
    # True if input is not greater than the length of the event list
    
    #input.to_i > 0 || input.to_i <= RaEvents:Event.all.length
    true
  end
  
  def event_details(input)
    puts "Here are the event details"
  #  event = RaEvents::Event.find(input.to_i)
    #list of event attriburtes
  #  puts "#{event.name}"
    #puts "#{event.url}"
  #  puts "#{event.date}"
  #  puts "#{event.city}"
    #puts "#{event.venue}"
    #puts "Cost: #{event.price}"
    #puts "Minimum Age: #{event.min_age}"
    #puts "Ticket URL: #{event.ticket_url}"
  end
        
  def option_menu
    #returns list of options for user to select
    sleep(2)
    puts "To return to the event list, enter '1'"
    puts "To select another state, enter '2'"
    puts "To exit the app, enter 'exit'"
    input = gets.strip
    if input.to_i == 1
      event_list(state)
    elsif input.to_i == 2
      start
    elsif input == "exit"
      quit?(input)
    else
      puts "Invalid entry"
      option_menu
    end
  end
  
  def quit?(input)
    if input == "quit"
      exit!
    end
  end
  
  STATES = ["alabama", "alaska", "arizona", "arkansas", "california", "colorado", "delaware", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "newhampshire", "newjersey", "newmexico", "newyork", "northcarolina", "northdakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhodeisland", "southcarolina", "southdakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "westvirginia", "wisconsin", "wyoming"]
    
end

# CLI series of Events

#call
#  Welcome user
#  Please enter name of state where you'd like to see show
  
#  User inputs name of state
  
#  returns list of events
#  puts "Please pick an event"
  
#  User inputs number corresponding to an event
  
#  returns event attributes
  
#  returns list of options for user to select
#  1. return to event list?
#  2. choose a different state?
#  3. quit?