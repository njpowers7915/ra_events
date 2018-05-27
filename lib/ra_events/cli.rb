class RaEvents::CLI
  
  def call
    puts "Welcome to the Resident Advisor Event Finder!"
    search_by_state
  end
  
  def search_by_state(state_name)
    puts "Please enter the name of the state where you would like to see a show: "
    #takes in user input (state name) and returns list of events in that state
        #Format: 1. name - date - city - url - venue - ticket_url - cost - minimum_age
  end
  
  def select_event(event_number)
    puts "Please enter event number"
    #takes in user input (event_number) and returns list of event attributes
      #Attributes in returned list:
        #name, website_link, date, city, 
end

# CLI series of Events

call
  Welcome user
  Please enter name of state where you'd like to see show
  
  User inputs name of state
  
  returns list of events
  puts "Please pick an event"
  
  User inputs number corresponding to an event
  
  returns event attributes
  
  returns list of options for user to select
  1. return to event list?
  2. choose a different state?
  3. quit?
  