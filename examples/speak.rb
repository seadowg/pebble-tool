require "pebble-tool"

class Input
  def initialize
    Thread.new do
      while true
        self.emit(gets)
      end
    end
  end
end

messages = Frappuccino::Stream.new(Input.new)
PebbleTool::NotificationApp.new("Speak", messages)