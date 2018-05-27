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
    input = gets.strip.downcase
    #if input is a valid state name, then RA website URL will be valid
        #Will return event_list
    #if input is not a valid state name, RA website URL will not be valid
        #Will ask user to try again
  end
  
  def event_list
    #list of events in a particular state
    #Format: 1. name - date - city - url - venue - ticket_url - cost - minimum_age
  end
  
  def select_event(event_number)
    puts "Please enter event number"
    #takes in user input (event_number) and returns event_details
    event_details
  end
  
  def event_details
    #list of event attriburtes
    #Attributes in returned list:
        #name, website_link, date, city, 
  end
        
  def option_menu
    #returns list of options for user to select
    puts "To return to the event list, enter '1'"
    puts "To select another state, enter '2'"
    puts "To exit the app, enter 'exit'"
    input = gets.strip
    if input == 1
      select_event(event_number)
    elsif input == 2
      search_by_state(state_name)
    elsif input == "exit"
      #quit application
    else
      puts "Invalid entry"
      puts option_menu
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