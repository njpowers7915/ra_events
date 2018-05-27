class RaEvents::CLI
  
  def call
    puts "Welcome to the Resident Advisor Event Finder!"
    puts "Overview of basic commands eg quit, new_state, etc..."
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
  
  def valid_state?(input)
    # True if valid url can be made from input
    true
  end
  
  def event_list(state)
    #list of events in a particular state
    #Will take state as an argument because each state requires a different URL for scraping
    puts "1. event_name_1 -- date_1 -- city_1"
    puts "2. event_name_1 -- date_1 -- city_1"
    puts "3. event_name_1 -- date_1 -- city_1"
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
    input.to_i > 0 || input.to_i <= event_array.length
  end
  
  def event_details(input)
    #list of event attriburtes
    puts "name"
    puts "url"
    puts "date"
    puts "city"
    puts "venue"
    puts "Cost: "
    puts "Minimum Age: "
    puts "Ticket URL: "
  end
        
  def option_menu
    #returns list of options for user to select
    sleep(2)
    puts "To return to the event list, enter '1'"
    puts "To select another state, enter '2'"
    puts "To exit the app, enter 'exit'"
    input = gets.strip
    if input == "1"
      select_event(event_number)
    elsif input == "2"
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