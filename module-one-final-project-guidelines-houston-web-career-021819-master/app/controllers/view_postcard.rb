
  def view_postcard(current_sender)
    puts ""
    prompt = TTY::Prompt.new
    
    counter = 1    
    all_postcards  = {}
    current_sender.postcards.map do |postcard|
       all_postcards[counter] = postcard.receiver.name  #returns {1 => "Jack Rotta", 2 => "Amily"}
       counter += 1
    end


    selected_receiver = prompt.select("💌  Your current postcards  💌:", all_postcards.map{|index, receiver_name| receiver_name})  #grab the name of the receiver
    
    selected_receiver_id = Receiver.find_by(name: selected_receiver)  #grab receiver's id
    selected_postcard =  Postcard.find_by(receiver_id: selected_receiver_id) #grab the postcard by receiver id
   
    
    
    puts ""
    puts "Type: #{selected_postcard.category}"
    puts ""
    puts "Deco: #{selected_postcard.deco.split("(")[0]}"
    puts ""
    puts "To: #{selected_receiver}"
    puts ""
    puts "Message: #{selected_postcard.message}"
    puts ""
    puts "From💌: #{current_sender.name}"    
    puts ""

    prompt = TTY::Prompt.new
    choices = {"[1] Send a new postcard" => -> do send_a_new_post_card(current_sender) end, 
               "[2] View postcard" => -> do view_postcard(current_sender) end, 
               "[3] Revise your postcard" => -> do revise_your_postcard(current_sender) end, 
               "[4] Cancel your order" => -> do cancel_your_order(current_sender) end,
               "[5] Exit" => -> do exit! end}.each {|option, methods| option}
    selection = prompt.select("Do you like your card #{current_sender.name.split(" ")[0]} What would you like to do now?", choices)
    
  
  end


