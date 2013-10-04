require 'pebble-tool'

PebbleTool::MediaPlayerApp.new("Lithium Hunter") do |controls|
  mine_button = controls.play_button.scan(0) do |accum, current|
    accum = 0 if accum > 468
    accum + (Random.new.rand * 20).ceil
  end
  
  reset_button = controls.next_button.map { 0 }

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

  quit_button = controls.previous_button
  quit_button.on_value { puts "\nBye bye!" }
  
  quit_button
end