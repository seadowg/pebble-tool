require "pebble"
require "frappuccino"

module PebbleTool
  class MediaControl
    def initialize(watch)
      @watch = watch
    end
    
    def play_button
      button_event(:playpause)
    end
    
    def previous_button
      button_event(:previous)
    end
    
    def next_button
      button_event(:next)
    end
    
    private
    
    def button_event(button_name)
      proxy = Event.new
      
      @watch.on_event(:media_control) do |event|
        case event.button
        when button_name
          proxy.occur
        end
      end
      
      Frappuccino::Stream.new(proxy)
    end
  end
  
  class MediaPlayerApp
    def initialize(&blk)
      watch = Pebble::Watch.autodetect
      watch.connect
      
      quit_event = blk.call(MediaControl.new(watch))
      quit_event.on_value { watch.disconnect }
    
      watch.listen_for_events
    end
  end
  
  private
  
  class Event
    def occur
      emit(nil)
    end
  end
end