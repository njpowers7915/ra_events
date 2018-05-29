# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
--> This app returns a list of music events and details about specific events based on user input.

- [x] Pull data from an external source
--> The app pulls data from the "Resident Advisor" website and interpolates a state name into the URL. This allows the user to look for events in their state.

- [x] Implement both list and detail views
--> The CLI method #event_list outputs a list of all events in a given state with some basic details. When the user selects an event from this list they are shown even more details of the given event. They are then asked if they want to return to the event list, or search by a different state.