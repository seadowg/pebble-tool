require_relative '../pebble-tool'

def attach_game(watch)
  mine_button = watch.play_button.scan(0) do |accum, current|
    accum = 0 if accum > 468
    accum + (Random.new.rand * 20).ceil
  end

  quit_button = watch.previous_button
  reset_button = watch.next_button.map { 0 }

  mine_button.merge(reset_button).on_value do |count|
    if count < 468
      puts "You have #{count} lithiums..."
    elsif count > 468
      puts "\nYou lose... Try again!\n\n"
    else
      puts "\nYou win!... but still... Try again!\n\n"
    end
  end

  reset_button.on_value do
    puts "\nOk. Starting again...\n\n"
  end

  quit_button.on_value do 
    puts "Bye bye..."
    watch.disconnect 
  end
end

watch = PebbleTool::Watch.autodetect
attach_game(watch)

puts "Welcome to Lithium Hunter Pebble Edition!"
puts "Connecting to Pebble..."
watch.connect

puts "\nMINE!!!\n\n"
watch.listen