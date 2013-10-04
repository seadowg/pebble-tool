require_relative '../pebble-tool'

class Playing
  attr_reader :count
  
  def intialize(count)
    @count = count
  end
end

class Lose; end
class Win; end

puts "Wait..."

watch = PebbleTool::Watch.autodetect
watch.connect

controller = watch.play_button.scan(0) do |accum, current|
  accum = 0 if accum > 468
  accum + (Random.new.rand * 20).ceil
end

game = controller.on_value do |count|
  if count < 468
    puts "You have #{count} lithiums..."
  elsif count > 468
    puts "You lose... Try again!"
  else
    puts "You win!... but still... Try again!"
  end
end

puts "MINE!!!"
watch.listen