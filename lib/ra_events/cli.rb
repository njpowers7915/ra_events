require 'pry'

class RaEvents::CLI
  @event_list = []
  @state_url = nil
  
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
  
  def valid_state?(state)
    STATES.include?(state)
  end
  
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
      
  def search_by_state
    puts "Please enter the name of the state where you would like to see a show: "
    input = gets.strip
    state = input_to_state(input)
    event_list(state)
    event_list_display
    #if input is a valid state name, then method will return event_list
    #if input is not valid, user will be asked to try again
  end
  
  def url_creator(state)
    date = Time.now.strftime("%Y-%m-%d")
    url = "https://www.residentadvisor.net/events/us/#{state}/month/#{date}"
  end
  
  def event_list_display
    @event_list.each do |i|
      puts i
    end
  end
  
  def event_list(state)
    #list of events in a particular state
    #Will plug state into a URL and send that off to Scraper
    #Scraper will return results
    #Event.new_from_url will need url argument
    RaEvents::Event.reset
    @state_url = url_creator(state)
    RaEvents::Scraper.new.make_events
    count = 1
    RaEvents::Event.all.each do |i|
      event =  "#{count}. #{i.name} -- #{i.date} -- #{i.city}"
      @event_list.nil? ? @event_list = [event] : @event_list << [event]
      count += 1
    end
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