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
    #puts "Overview of basic commands eg quit, new_state, etc..."
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
    event_array = RaEvents::Scraper.new.make_events(state)
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
      puts "#{count}. #{i.name} -- #{i.date} -- #{i.city}"
      count += 1
    end
  end
  
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
    #if input is valid, then method will return event_details
    #if input is not valid, user will be asked to try again
    end
  end
  
  def valid_number?(input)
# True if input is less than the length of the event list
    input.to_i > 0 && input.to_i <= RaEvents::Event.all.length
  end
  
  def event_details(input)
    puts "Event Details"
    puts "-------------"
    event = RaEvents::Event.find(input.to_i)
    #list of event attriburtes
    puts "#{event.name}"
    puts "#{event.url}"
    puts "#{event.date}"
    puts "#{event.city}"
    puts "#{event.venue}"
    puts "Ticket Price: #{event.price}"
    puts "Minimum Age: #{event.min_age}"
    puts "Ticket URL: #{event.ticket_url}"
  end
        
  def option_menu
    #returns list of options for user to select
    sleep(2)
    puts "To return to the event list, enter '1'"
    puts "To select another state, enter '2'"
    puts "To exit the app, enter 'exit'"
    input = gets.strip
    if input.to_i == 1
      event_list_display
      select_event
      option_menu
    elsif input.to_i == 2
      event_list_reset
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
  
  def event_list_reset
    @event_list = []
  end
  
  STATES = ["alabama", "alaska", "arizona", "arkansas", "california", "colorado", "delaware", "florida", "georgia", "hawaii", "idaho", "illinois", "indiana", "iowa", "kansas", "kentucky", "louisiana", "maine", "maryland", "massachusetts", "michigan", "minnesota", "mississippi", "missouri", "montana", "nebraska", "nevada", "newhampshire", "newjersey", "newmexico", "newyork", "northcarolina", "northdakota", "ohio", "oklahoma", "oregon", "pennsylvania", "rhodeisland", "southcarolina", "southdakota", "tennessee", "texas", "utah", "vermont", "virginia", "washington", "westvirginia", "wisconsin", "wyoming"]
    
end