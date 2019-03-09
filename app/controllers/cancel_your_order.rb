def cancel_your_order(current_sender)
  puts ""
  prompt = TTY::Prompt.new

  counter = 1    
  all_postcards  = {}
  current_sender.postcards.map do |postcard|
  all_postcards[counter] = postcard.receiver.name  #returns {1 => "Jack Rotta", 2 => "Amily"}
  counter += 1
  end


  selected_receiver = prompt.select("💌  Which one would you like to delete? Here are your current postcards  💌:", all_postcards.map{|index, receiver_name| receiver_name}) 
  selected_receiver_id = Receiver.find_by(name: selected_receiver)  #grab receiver's id
  selected_postcard =  Postcard.find_by(receiver_id: selected_receiver_id) #grab the postcard by receiver id
  


  puts ""
  puts "To: #{selected_postcard.receiver.name}"
  puts ""
  puts "Message: #{selected_postcard.message}"
  puts ""
  puts "From💌: #{current_sender.name}"
  puts ""
  
  answer = prompt.yes?('Are you sure you want to cancel?')
  # binding.pry
  if answer
     puts ""
     Postcard.destroy(selected_postcard.id)
     choices = {"[1] Send a new postcard" => -> do send_a_new_post_card(current_sender) end, 
                "[2] View postcard" => -> do view_postcard(current_sender) end, 
                "[3] Revise your postcard" => -> do revise_your_postcard(current_sender)end, 
                "[4] Cancel your order" => -> do cancel_your_order(current_sender) end,
                "[5] Go back to main menu" => -> do main_menu(current_sender) end,
                "[6] Exit" => -> do exit! end}.each {|option, methods| option}
     selection = prompt.select("Sorry you don't like your postcard... What would you like to do now #{current_sender.name.split(" ")[0]}?", choices)
  else
    puts ""
    choices = {"[1] Send a new postcard" => -> do send_a_new_post_card(current_sender) end, 
               "[2] View postcard" => -> do view_postcard(current_sender) end, 
               "[3] Revise your postcard" => -> do revise_your_postcard (current_sender)end, 
               "[4] Cancel your order" => -> do cancel_your_order(current_sender) end,
               "[5] Go back to main menu" => -> do main_menu(current_sender) end,
               "[6] Exit" => -> do exit! end}.each {|option, methods| option}
    selection = prompt.select("Sure we will keep your postcard! What would you like to do now?", choices)
  end

end