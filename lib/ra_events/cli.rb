require 'pry'

class RaEvents::CLI
  @event_list = []
  @state_url = nil
  
# Initiates the program in ./bin/ra_events
  def call
    puts
    puts "Welcome to the Resident Advisor Event Finder!"
    puts
    sleep(2)
    puts
    start
  end
  
# Main events of CLI interaction
  def start
    search_by_state
    select_event
    option_menu
  end

# Gets user_input of a state name
# Sends a formatted version of the state name to be interpolated into URL by Scraper
# Returns list of events in a given state
  def search_by_state
    puts "Please enter the name of the state where you would like to see a show: "
    input = gets.strip
    state = input_to_state(input)
    RaEvents::Scraper.new.make_events(state)
    event_list
  end
  
# Takes in user input of a state name
# Returns formatted version to be interpolated into url
  def input_to_state(input)
    state = input.downcase.gsub(/\s+/, "")
    if valid_state?(state) == false
      puts "Invalid state name"
      sleep(1)
      puts
      search_by_state
    elsif state == "washington"
      washington_special_case
    else
      state
    end
    state
  end
  
# Checks to make sure user input is the name of a state
  def valid_state?(state)
    STATES.include?(state)
  end
  
# Differentiates between WA (state) and DC
  def washington_special_case
    puts "Enter 1 for Washington (state)"
    puts "Enter 2 for Washington DC"
    user_choice = gets.strip
    if user_choice == "1"
      state = "washingtonstate"
    elsif user_choice == "2"
      state = "washingtondc"
    else
      puts "Invalid"
      washington_special_case
    end
    state
  end
  
#Creates a list of all events in a given state with some basic details
  def event_list
    count = 1
    RaEvents::Event.all.each do |i|
      puts "#{count} -->" 
      puts "#{i.name}"
      puts "#{i.date}"
      if i.city != "TBA"
        puts "#{i.city}"
      end
      count += 1
    end
  end

#This is a test method to make sure scraping is pulling correct data 
 #def test_event_list
  #  count = 1
  #  RaEvents::Event.all.each do |i|
  #    puts "count = #{count}" 
  #    puts "name = #{i.name}"
  #    puts "date = #{i.date}"
  #    puts "city = #{i.city}"
  #    puts "url = #{i.url}"
  #    puts "venue = #{i.venue}"
  #    puts "price = #{i.price}"
  #    puts "min_age = #{i.min_age}"
  #    puts
  #    count += 1
  #  end
  #end 
  
# User selects event from the event list
# Returns all details of specified event
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
    end
  end
  
#Checks to make sure user inputs valid number
  def valid_number?(input)
    input.to_i > 0 && input.to_i <= RaEvents::Event.all.length
  end
  
#Accepts user input
#Returns list of all event details
  def event_details(input)
    puts "Event Details"
    puts "-------------"
    event = RaEvents::Event.find(input.to_i)
    #list of event attriburtes
    puts "#{event.name}"
    puts "#{event.date}"
    puts "-------------"
    puts "#{event.url}"
    puts "-------------"
    puts "#{event.venue}"
    puts "#{event.city}"
    puts "-------------"
    puts "Ticket Price: #{event.price}"
    puts "Minimum Age: #{event.min_age}"
  end
       
#Lets user go-back, search by another state, or quit
  def option_menu
    sleep(2)
    puts "To return to the event list, enter '1'"
    puts "To select another state, enter '2'"
    puts "To leave the app, enter 'quit'"
    input = gets.strip
    if input.to_i == 1
      event_list
      select_event
      option_menu
    elsif input.to_i == 2
      RaEvents::Event.reset
      start
    elsif input == "quit"
      quit?(input)
    else
      puts "Invalid entry"
      option_menu
    end
  end
  
  def quit?(input)
    if input.downcase == "quit"
      exit!
    end
  end
  
  STATES = ["alabama", "alaska", "arizona", "arkansas", "california", "colorado", "delaware", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "newhampshire", "newjersey", "newmexico", "newyork", "northcarolina", "northdakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhodeisland", "southcarolina", "southdakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "westvirginia", "wisconsin", "wyoming"]
    
end