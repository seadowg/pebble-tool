require "pebble"
require "frappuccino"

module PebbleTool
  class Watch < Pebble::Watch
    def play_button
      button_event(:playpause)
    end
    
    def listen
      listen_for_events
    end
    
    private
    
    def button_event(button_name)
      proxy = Event.new
      
      on_event(:media_control) do |event|
        case event.button
        when button_name
          proxy.occur
        end
      end
      
      Frappuccino::Stream.new(proxy)
    end
  end
  
  private
  
  class Event
    def occur
      emit(nil)
    end
  end
end